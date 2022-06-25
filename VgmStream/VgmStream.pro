QT       -= core gui
CONFIG   -= qt

TARGET = vgmstream
TEMPLATE = lib
CONFIG += staticlib link_pkgconfig

include(VgmStream-conf.pri)

SOURCES += \
    src/vgmstream.c \
    src/util.c \
    src/streamfile.c \
    src/coding/xa_decoder.c \
    src/coding/ws_decoder.c \
    src/coding/sdx2_decoder.c \
    src/coding/SASSC_decoder.c \
    src/coding/psx_decoder.c \
    src/coding/pcm_decoder.c \
    src/coding/ogg_vorbis_decoder.c \
    src/coding/nwa_decoder.c \
    src/coding/ngc_dtk_decoder.c \
    src/coding/ngc_dsp_decoder.c \
    src/coding/ngc_afc_decoder.c \
    src/coding/nds_procyon_decoder.c \
    src/coding/mtaf_decoder.c \
    src/coding/msadpcm_decoder.c \
    src/coding/mpeg_decoder.c \
    src/coding/lsf_decoder.c \
    src/coding/l5_555_decoder.c \
    src/coding/ima_decoder.c \
    src/coding/g7221_decoder.c \
    src/coding/g721_decoder.c \
    src/coding/eaxa_decoder.c \
    src/coding/aica_decoder.c \
    src/coding/adx_decoder.c \
    src/coding/acm_decoder.c \
    src/layout/xvas_block.c \
    src/layout/xa_blocked.c \
    src/layout/wsi_blocked.c \
    src/layout/ws_aud_blocked.c \
    src/layout/vs_blocked.c \
    src/layout/tra_blocked.c \
    src/layout/thp_blocked.c \
    src/layout/str_snds_blocked.c \
    src/layout/scd_int_layout.c \
    src/layout/psx_mgav_blocked.c \
    src/layout/ps2_strlr_blocked.c \
    src/layout/ps2_iab_blocked.c \
    src/layout/ps2_adm_blocked.c \
    src/layout/nolayout.c \
    src/layout/mxch_blocked.c \
    src/layout/mus_acm_layout.c \
    src/layout/ivaud_layout.c \
    src/layout/interleave_byte.c \
    src/layout/interleave.c \
    src/layout/ims_block.c \
    src/layout/halpst_blocked.c \
    src/layout/gsb_blocked.c \
    src/layout/filp_blocked.c \
    src/layout/emff_blocked.c \
    src/layout/ea_block.c \
    src/layout/de2_blocked.c \
    src/layout/caf_blocked.c \
    src/layout/blocked.c \
    src/layout/bdsp_blocked.c \
    src/layout/ast_blocked.c \
    src/layout/aix_layout.c \
    src/layout/aax_layout.c \
    src/meta/zwdsp.c \
    src/meta/zsd.c \
    src/meta/ydsp.c \
    src/meta/xwb.c \
    src/meta/xss.c \
    src/meta/xbox_xwav.c \
    src/meta/xbox_xvas.c \
    src/meta/xbox_xmu.c \
    src/meta/xbox_wavm.c \
    src/meta/xbox_stma.c \
    src/meta/xbox_ims.c \
    src/meta/xbox_hlwav.c \
    src/meta/x360_tra.c \
    src/meta/wvs.c \
    src/meta/ws_aud.c \
    src/meta/wpd.c \
    src/meta/wii_sts.c \
    src/meta/wii_str.c \
    src/meta/wii_sng.c \
    src/meta/wii_smp.c \
    src/meta/wii_ras.c \
    src/meta/wii_mus.c \
    src/meta/wii_bns.c \
    src/meta/vsf.c \
    src/meta/vs.c \
    src/meta/vgs.c \
    src/meta/tun.c \
    src/meta/thp.c \
    src/meta/svs.c \
    src/meta/stx.c \
    src/meta/str_snds.c \
    src/meta/str_asr.c \
    src/meta/ss_stream.c \
    src/meta/sqex_scd.c \
    src/meta/spt_spd.c \
    src/meta/sli.c \
    src/meta/sfl.c \
    src/meta/seg.c \
    src/meta/sdt.c \
    src/meta/sd9.c \
    src/meta/sat_sap.c \
    src/meta/sat_dvi.c \
    src/meta/sat_baka.c \
    src/meta/s14_sss.c \
    src/meta/rwx.c \
    src/meta/rwsd.c \
    src/meta/rsf.c \
    src/meta/rsd.c \
    src/meta/rs03.c \
    src/meta/rkv.c \
    src/meta/riff.c \
    src/meta/redspark.c \
    src/meta/raw.c \
    src/meta/psx_str_mgav.c \
    src/meta/psx_gms.c \
    src/meta/psx_fag.c \
    src/meta/psx_cdxa.c \
    src/meta/ps3_xvag.c \
    src/meta/ps3_vawx.c \
    src/meta/ps3_sgh_sgb.c \
    src/meta/ps3_past.c \
    src/meta/ps3_msf.c \
    src/meta/ps3_klbs.c \
    src/meta/ps3_ivag.c \
    src/meta/ps3_cps.c \
    src/meta/ps2_xau.c \
    src/meta/ps2_xa30.c \
    src/meta/ps2_xa2.c \
    src/meta/ps2_wmus.c \
    src/meta/ps2_wb.c \
    src/meta/ps2_wad.c \
    src/meta/ps2_vpk.c \
    src/meta/ps2_voi.c \
    src/meta/ps2_vms.c \
    src/meta/ps2_vgv.c \
    src/meta/ps2_vgs.c \
    src/meta/ps2_vas.c \
    src/meta/ps2_vag.c \
    src/meta/ps2_tk5.c \
    src/meta/ps2_tec.c \
    src/meta/ps2_svag.c \
    src/meta/ps2_strlr.c \
    src/meta/ps2_str.c \
    src/meta/ps2_stm.c \
    src/meta/ps2_ster.c \
    src/meta/ps2_sps.c \
    src/meta/ps2_spm.c \
    src/meta/ps2_snd.c \
    src/meta/ps2_smpl.c \
    src/meta/ps2_sl3.c \
    src/meta/ps2_sfs.c \
    src/meta/ps2_rxw.c \
    src/meta/ps2_rws.c \
    src/meta/ps2_rstm.c \
    src/meta/ps2_rnd.c \
    src/meta/ps2_psw.c \
    src/meta/ps2_psh.c \
    src/meta/ps2_pnb.c \
    src/meta/ps2_p2bt.c \
    src/meta/ps2_npsf.c \
    src/meta/ps2_mtaf.c \
    src/meta/ps2_mss.c \
    src/meta/ps2_msa.c \
    src/meta/ps2_mihb.c \
    src/meta/ps2_mic.c \
    src/meta/ps2_mib.c \
    src/meta/ps2_mcg.c \
    src/meta/ps2_lpcm.c \
    src/meta/ps2_leg.c \
    src/meta/ps2_khv.c \
    src/meta/ps2_kces.c \
    src/meta/ps2_jstm.c \
    src/meta/ps2_joe.c \
    src/meta/ps2_int.c \
    src/meta/ps2_ild.c \
    src/meta/ps2_ikm.c \
    src/meta/ps2_iab.c \
    src/meta/ps2_hsf.c \
    src/meta/ps2_hgc1.c \
    src/meta/ps2_gcm.c \
    src/meta/ps2_gbts.c \
    src/meta/ps2_filp.c \
    src/meta/ps2_exst.c \
    src/meta/ps2_enth.c \
    src/meta/ps2_dxh.c \
    src/meta/ps2_ccc.c \
    src/meta/ps2_bmdx.c \
    src/meta/ps2_bg00.c \
    src/meta/ps2_b1s.c \
    src/meta/ps2_aus.c \
    src/meta/ps2_ast.c \
    src/meta/ps2_ass.c \
    src/meta/ps2_adsc.c \
    src/meta/ps2_ads.c \
    src/meta/ps2_adm.c \
    src/meta/ps2_2pfs.c \
    src/meta/pos.c \
    src/meta/pona.c \
    src/meta/pc_sob.c \
    src/meta/pc_snds.c \
    src/meta/pc_smp.c \
    src/meta/pc_mxst.c \
    src/meta/pcm.c \
    src/meta/pc_adp.c \
    src/meta/p3d.c \
    src/meta/ogg_vorbis_file.c \
    src/meta/nwa.c \
    src/meta/nub.c \
    src/meta/ngc_ymf.c \
    src/meta/ngc_waa_wac_wad_wam.c \
    src/meta/ngc_tydsp.c \
    src/meta/ngc_ssm.c \
    src/meta/ngc_sck_dsp.c \
    src/meta/ngc_pdt.c \
    src/meta/ngc_nst_dsp.c \
    src/meta/ngc_lps.c \
    src/meta/ngc_gcub.c \
    src/meta/ngc_ffcc_str.c \
    src/meta/ngc_dsp_ygo.c \
    src/meta/ngc_dsp_std.c \
    src/meta/ngc_dsp_mpds.c \
    src/meta/ngc_dsp_konami.c \
    src/meta/ngc_caf.c \
    src/meta/ngc_bo2.c \
    src/meta/ngc_bh2pcm.c \
    src/meta/ngc_adpdtk.c \
    src/meta/ngca.c \
    src/meta/nds_swav.c \
    src/meta/nds_strm.c \
    src/meta/nds_sad.c \
    src/meta/nds_rrds.c \
    src/meta/nds_hwas.c \
    src/meta/naomi_spsd.c \
    src/meta/naomi_adpcm.c \
    src/meta/myspd.c \
    src/meta/musx.c \
    src/meta/musc.c \
    src/meta/mus_acm.c \
    src/meta/msvp.c \
    src/meta/mn_str.c \
    src/meta/maxis_xa.c \
    src/meta/mattel_hyperscan.c \
    src/meta/lsf.c \
    src/meta/kraw.c \
    src/meta/ivb.c \
    src/meta/ivaud.c \
    src/meta/ish_isd.c \
    src/meta/ios_psnd.c \
    src/meta/idsp.c \
    src/meta/his.c \
    src/meta/halpst.c \
    src/meta/gsp_gsb.c \
    src/meta/gh3_bar.c \
    src/meta/genh.c \
    src/meta/gcsw.c \
    src/meta/gca.c \
    src/meta/fsb.c \
    src/meta/ffw.c \
    src/meta/excitebots.c \
    src/meta/exakt_sc.c \
    src/meta/emff.c \
    src/meta/ea_old.c \
    src/meta/ea_header.c \
    src/meta/dsp_sth_str.c \
    src/meta/dsp_bdsp.c \
    src/meta/dmsg_segh.c \
    src/meta/de2.c \
    src/meta/dc_str.c \
    src/meta/dc_kcey.c \
    src/meta/dc_idvi.c \
    src/meta/dc_dcsw_dcs.c \
    src/meta/dc_asd.c \
    src/meta/Cstr.c \
    src/meta/capdsp.c \
    src/meta/brstm.c \
    src/meta/bnsf.c \
    src/meta/bgw.c \
    src/meta/baf.c \
    src/meta/ast.c \
    src/meta/apple_caff.c \
    src/meta/aix.c \
    src/meta/aifc.c \
    src/meta/ahx.c \
    src/meta/agsc.c \
    src/meta/afc_header.c \
    src/meta/adx_header.c \
    src/meta/ads.c \
    src/meta/acm.c \
    src/meta/aax.c \
    src/meta/2dx9.c \
    src/meta/2dx.c

OTHER_FILES += \
    VgmStream-conf.pri \
    VgmStream.pri

HEADERS += \
    src/vgmstream.h \
    src/util.h \
    src/streamtypes.h \
    src/streamfile.h \
    src/coding/nwa_decoder.h \
    src/coding/g72x_state.h \
    src/coding/coding.h \
    src/coding/acm_decoder.h \
    src/layout/layout.h \
    src/meta/meta.h