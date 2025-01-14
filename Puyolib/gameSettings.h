#ifndef GAMESETTINGS_H
#define GAMESETTINGS_H

#include "ruleset.h"
#include "dropPattern.h"
#include <string>
#include <map>

namespace ppvs
{
struct rulesetInfo_t
{
    rulesetInfo_t();
    rulesetInfo_t(rules type);
    void setRules(rules type);
    rules rulesetType;
    bool custom;
    bool quickDrop;
    int marginTime;
    int targetPoint;
    int requiredChain;
    int initialFeverCount;
    int feverPower;
    int puyoToClear;
    int Nplayers;
    int colors;
};

struct replay_ruleset_header
{
    rules rulesetType;
	int marginTime;
    int targetPoint;
    int requiredChain;
    int initialFeverCount;
    int feverPower;
    int puyoToClear;
    int Nplayers;
	int quickDrop;

	int futureRules[10];
};

struct gameSettings
{//object to pass to game
    gameSettings(const rulesetInfo_t &rulesetInfo=rulesetInfo_t());
    ~gameSettings();

    //game settings
    int Nplayers;
    int Nhumans;
    rulesetInfo_t rulesetInfo;
    bool rankedMatch;
    int maxWins;
    recordState recording;

    //custom settings
    bool playSound;
    bool playMusic;
    std::string language;
    std::string background;
    std::string puyo;
    std::string sfx;
    std::map<puyoCharacter,std::string> characterSetup;
    std::map<std::string,std::string> controls;
    puyoCharacter defaultPuyoCharacter;
    bool useCharacterField;
    bool startWithCharacterSelect;
    bool pickColors;
    bool useCPUplayers; //this is set for testing or endless
    bool spectating; //set on if player intends to spectate match
    int showNames; //for replays, 0= showall, 1=not p1, 2=hide all

    //replay
    std::deque<std::string> replayPlayList;
    std::deque<std::string> oldReplayPlayList;

    //account settings
};

}
#endif // GAMESETTINGS_H
