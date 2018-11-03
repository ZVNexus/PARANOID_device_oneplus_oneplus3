#
# Copyright (C) 2020 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

PRODUCT_PROPERTY_OVERRIDES += \
    rild.libpath=/vendor/lib64/libril-qc-qmi-1.so \
    persist.rild.nitz_plmn= \
    persist.rild.nitz_long_ons_0= \
    persist.rild.nitz_long_ons_1= \
    persist.rild.nitz_long_ons_2= \
    persist.rild.nitz_long_ons_3= \
    persist.rild.nitz_short_ons_0= \
    persist.rild.nitz_short_ons_1= \
    persist.rild.nitz_short_ons_2= \
    persist.rild.nitz_short_ons_3= \
    ril.subscription.types=NV,RUIM \
    DEVICE_PROVISIONED=1 \
    ro.telephony.default_network=22,20 \
    persist.sys.fflag.override.settings_network_and_internet_v2=true \
    debug.sf.enable_hwc_vds=1 \
    debug.sf.hw=1 \
    debug.sf.latch_unsignaled=1 \
    debug.egl.hw=1 \
    debug.gralloc.enable_fb_ubwc=1 \
    dalvik.vm.heapsize=36m \
    dev.pm.dyn_samplingrate=1 \
    persist.demo.hdmirotationlock=false \
    debug.sf.recomputecrop=0 \
    vendor.video.disable.ubwc=1 \
    sdm.perf_hint_window=50 \
    sdm.debug.disable_skip_validate=1 \
    vendor.gralloc.enable_fb_ubwc=1 \
    vendor.display.disable_skip_validate=1 \
    vendor.display.perf_hint_window=50 \
    vendor.display.enable_default_color_mode=1 \
    persist.vendor.cne.feature=1 \
    persist.net.doxlat=false \
    media.stagefright.enable-player=true \
    media.stagefright.enable-http=true \
    media.stagefright.enable-aac=true \
    media.stagefright.enable-qcp=true \
    media.stagefright.enable-scan=true \
    mmp.enable.3g2=true \
    media.aac_51_output_enabled=true \
    mm.enable.smoothstreaming=true \
    audio.offload.min.duration.secs=30 \
    audio.offload.video=true \
    audio.deep_buffer.media=true \
    ro.af.client_heap_size_kbyte=7168 \
    af.fast_track_multiplier=1 \
    persist.mm.enable.prefetch=true \
    vidc.enc.dcvs.extra-buff-count=2 \
    vendor.vidc.enc.disable.pq=true \
    ro.vendor.use_data_netmgrd=true \
    persist.data.netmgrd.qos.enable=true \
    persist.vendor.data.mode=concurrent \
    vendor.bluetooth.soc=rome \
    persist.timed.enable=true \
    bt.max.hfpclient.connections=1 \
    ro.qualcomm.cabl=2 \
    ro.vendor.display.cabl=2 \
    telephony.lteOnCdmaDevice=1 \
    persist.fuse_sdcard=true \
    persist.debug.wfd.enable=1 \
    persist.sys.wfd.virtual=0 \
    ro.nfc.port=I2C \
    persist.hwc.enable_vds=1 \
    persist.debug.coresight.config=stm-events \
    persist.qfp=false \
    persist.sys.pd_enable=0 \
    sdm.debug.disable_rotator_split=1 \
    Camera.no_navigation_bar=true \
    ro.cutoff_voltage_mv=3250 \
    persist.vendor.camera.display.umax=1920x1080 \
    persist.vendor.camera.display.lmax=1280x720 \
    vendor.camera.hal1.packagelist=com.whatsapp,com.intsig.camscanner \
    persist.ts.postmakeup=false \
    persist.ts.rtmakeup=false \
    ro.qti.sensors.dev_ori=false \
    ro.qti.sensors.pmd=false \
    ro.qti.sensors.sta_detect=false \
    ro.qti.sensors.mot_detect=false \
    persist.vendor.radio.hw_mbn_update=0 \
    persist.vendor.radio.sw_mbn_update=0 \
    persist.vendor.radio.start_ota_daemon=1 \
    persist.vendor.radio.ignore_dom_time=10 \
    persist.vendor.radio.rat_on=combine \
    persist.data.iwlan.enable=true \
    persist.vendor.radio.data_ltd_sys_ind=1 \
    persist.vendor.radio.data_con_rprt=1 \
    persist.radio.efssync=true \
    ro.vendor.display.sensortype=3 \
    ro.vendor.display.paneltype=1 \
    ro.vendor.display.foss=1 \
    vendor.display.foss.config=1 \
    vendor.display.foss.config_path=/vendor/etc/FOSSConfig.xml
