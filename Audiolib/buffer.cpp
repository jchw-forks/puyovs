#include <cstring>
#include <cstdlib>
#include <iostream>
#include <sstream>
#include "buffer.h"

#ifdef _WIN32
#include <process.h>
#define getpid _getpid
#else
#include <unistd.h>
#endif

namespace alib {

////////////////////////////////////////////////////////////////////////////////
// Buffer

struct Buffer::Priv {
    char *data;
    size_t size;
    bool locked;

    Priv() : data(0), size(0), locked(false) { }
    Priv(char *data, size_t size) : data(0), size(0), locked(false) { copy(data, size); }
    Priv(const Priv &other) { if(other.locked) abort(); copy(other.data, other.size); locked = false; }
    ~Priv() { if(locked) abort(); if(data) free(data); data = 0; }

    int read(char *buffer, size_t amount, long offset)
    {
        if(amount > size - offset)
            amount = size - offset;

        if(amount < 1)
            return 0;

        memcpy(buffer, data + offset, amount);

        return amount;
    }

    void append(const char *d, size_t s)
    {
        data = (char*)realloc(data, size + s);
        memcpy(data + size, d, s);
        size += s;
    }

    void copy(const char *d, size_t s)
    {
        data = (char*)malloc(s);
        memcpy(data, d, s);
        size = s;
    }

    void removeFront(size_t s)
    {
        if(s >= size)
        {
            size = 0;
        }
        else
        {
            size -= s;
            memmove(data, data + s, size);
            data = (char*)realloc(data, size);
        }
    }

    void truncate(size_t s)
    {
        if(s > size)
            return;

        data = (char *)realloc(data, s);
        size = s;
    }
};

Buffer::Buffer()
    : p(new Priv)
{
}

Buffer::Buffer(char *data, size_t size)
    : p(new Priv(data, size))
{
}

Buffer::Buffer(const Buffer &other)
    : p(other.p)
{
}

Buffer::~Buffer()
{
}

int Buffer::read(void *buffer, size_t amount, long offset)
{
    return p->read((char*)buffer, amount, offset);
}

void Buffer::append(const void *data, size_t size)
{
    p->append((char*)data, size);
}

void Buffer::removeFront(size_t size)
{
    p->removeFront(size);
}

void Buffer::truncate(size_t size)
{
    p->truncate(size);
}

void Buffer::clear()
{
    p->truncate(0);
}

bool Buffer::isEmpty() const
{
    return !p->size;
}

const char *Buffer::data() const
{
    return p->data;
}

size_t Buffer::size() const
{
    return p->size;
}

char *Buffer::lock(int *size)
{
    p.detach();
    if(size)
        *size = p->size;
    p->locked = true;
    return p->data;
}

void Buffer::unlock()
{
    p->locked = false;
}

////////////////////////////////////////////////////////////////////////////////
// BinaryStream

BinaryStream::~BinaryStream()
{
}

int BinaryStream::readChar()
{
    unsigned char value;
    int bRead = read((char*)&value, 1);

    if(bRead < 1)
        return EOF;
    else
        return value;
}

long BinaryStream::size()
{
    if(!seekable()) return 0;
    else
    {
        long pos = tell();
        seek(0, End);
        long size = tell();
        seek(pos, Beginning);
        return size;
    }
}

char *BinaryStream::readAll(int *len)
{
    if(error())
    {
        *len = 0;
        return 0;
    }

    int bufferlen = 1024, bufferread = 0;
    char *buffer = (char *)malloc(bufferlen), *bufferptr = buffer;

    do
    {
        bufferread = read(bufferptr, 1024);

        bufferptr += bufferread;
        buffer = (char *)realloc(buffer, bufferlen += bufferread);
    }
    while(!eof() && bufferread > 0);

    *len = bufferread;
    return (char *)realloc(buffer, bufferread);
}

Buffer BinaryStream::readAll()
{
    if(error() || !hasEof())
        return Buffer();

    char *data;
    int len;

    data = readAll(&len);

    return Buffer(data, len);
}

std::string BinaryStream::url() const
{
    std::ostringstream ss;
    ss << "BinaryStream://" << std::hex << getpid() << "/" << this;

    return ss.str();
}

BinaryStream *BinaryStream::openUrl(const char *url, const char *mode)
{
    // Try FileStream (stdio)
    FileStream *fileStream = new FileStream(url, mode);
    if(!fileStream->error()) return fileStream;
    delete fileStream;
}

////////////////////////////////////////////////////////////////////////////////
// FileStream

struct FileStream::Priv
{
    FILE *file;
    std::string fn;
};

FileStream::FileStream(const char *fn, const char *mode)
    : p(new FileStream::Priv)
{
    p->file = ::fopen(fn, mode);
    p->fn = fn;

    if(!p->file)
        ALIB_ERROR("Error loading %s.\n", fn);
}

FileStream::~FileStream()
{
    if(p && p->file)
        ::fclose(p->file);
    delete p;
}

int FileStream::read(void *ptr, size_t size)
{
    return ::fread(ptr, 1, size, p->file);
}

int FileStream::readChar()
{
    return ::fgetc(p->file);
}

int FileStream::write(const void *ptr, size_t size)
{
    return ::fwrite(ptr, 1, size, p->file);
}

bool FileStream::seekable()
{
    return true;
}

bool FileStream::seek(long to, SeekOrigin origin)
{
    return ::fseek(p->file, to, (origin == Beginning ? SEEK_SET : (origin == End ? SEEK_END : SEEK_CUR))) == 0;
}
long FileStream::tell()
{
    return ::ftell(p->file);
}

bool FileStream::eof()
{
    return ::feof(p->file);
}

bool FileStream::hasEof()
{
    // not if you open /dev/random, i guess
    return true;
}

void FileStream::rewind()
{
    ::rewind(p->file);
}

bool FileStream::error()
{
    return !p->file;
}

long FileStream::size()
{
    long pos = ftell(p->file);
    fseek(p->file, 0, SEEK_END);
    long size = ftell(p->file);
    fseek(p->file, pos, SEEK_SET);
    return size;
}

char *FileStream::readAll(int *len)
{
    fseek(p->file, 0, SEEK_END);
    long size = ftell(p->file);
    fseek(p->file, 0, SEEK_SET);
    char *data = (char *)malloc(size);
    *len = size;
    fread(data, 1, size, p->file);
    return data;
}

Buffer FileStream::readAll()
{
    return BinaryStream::readAll();
}

std::string FileStream::url() const
{
    return p->fn;
}

////////////////////////////////////////////////////////////////////////////////
// MemoryStream

struct MemoryStream::Priv
{
    Priv(Buffer buffer) : buffer(buffer), c(0) { }

    Buffer buffer;
    long c;

    int read(void *ptr, size_t size)
    {
        if(size > buffer.size() - c)
            size = buffer.size() - c;

        if(size < 1)
            return 0;

        int read = buffer.read((char *)ptr, size, c);
        c += size;
        return read;
    }

    bool seek(long to, MemoryStream::SeekOrigin origin)
    {
        int bufSize = buffer.size();

        switch(origin)
        {
        case MemoryStream::Beginning:
            c = to;
            break;
        case MemoryStream::Current:
            c += to;
            break;
        case MemoryStream::End:
            c = bufSize + to;
            break;
        }

        if(c < 0) c = 0;
        if(c > bufSize) c = bufSize;

        return true;
    }
};

MemoryStream::MemoryStream(Buffer &buffer)
    : p(new Priv(buffer))
{
}

MemoryStream::~MemoryStream()
{
    delete p;
}

int MemoryStream::read(void *ptr, size_t size)
{
    return p->read(ptr, size);
}

int MemoryStream::write(const void *, size_t)
{
    return 0;
}

bool MemoryStream::seekable()
{
    return true;
}

bool MemoryStream::seek(long to, SeekOrigin origin)
{
    return p->seek(to, origin);
}

long MemoryStream::tell()
{
    return p->c;
}

bool MemoryStream::eof()
{
    return p->c == (long)p->buffer.size();
}

bool MemoryStream::hasEof()
{
    return true;
}

void MemoryStream::rewind()
{
    p->seek(0, Beginning);
}

bool MemoryStream::error()
{
    // No known error condition!
    return false;
}

long MemoryStream::size()
{
    return p->buffer.size();
}

}
