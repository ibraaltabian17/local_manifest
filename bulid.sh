rm -rf .repo/local_manifests/ 
rm -rf device/
rm -rf vendor/
rm -rf kernel/
repo init -u https://github.com/PixelOS-AOSP/android_manifest.git -b sixteen-qpr1 --git-lfs
 git clone https://github.com/ibraaltabian17/local_manifest.git --depth 1 -b pixelos-six .repo/local_manifests &&  
# Sync the repositories
if [ -f /usr/bin/resync ]
 then
  /usr/bin/resync 
else
  /opt/crave/resync.sh
fi && 
# Set up build environment
export BUILD_USERNAME=ibratabian17 
 export BUILD_HOSTNAME=prjktla 
 source build/envsetup.sh

 rm -rf hardware/qcom-caf/sdm845/display
rm -rf hardware/qcom-caf/sdm845/media
rm -rf hardware/qcom-caf/sdm845/audio
git clone https://github.com/Legendleo90/android_hardware_qcom_display hardware/qcom-caf/sdm845/display
git clone https://github.com/Legendleo90/android_hardware_qcom_media hardware/qcom-caf/sdm845/media
git clone https://github.com/Legendleo90/android_hardware_qcom_audio hardware/qcom-caf/sdm845/audio

# Qcom-caf
cd hardware/qcom-caf/common && git fetch https://github.com/Legendleo90/hardware_qcom-caf_common && git cherry-pick 9127db32a7e606c6675e2ca67e6c7a4796365c08 0139103bdee6f4923c37b03df89d394d3436ad6d 181ff134eac17c9cbc00618135b3827e5eab193a d7f571cc9063c7fa0564cab9a8e83407a5c6eae9 && cd ../../..

# Sepolicy
cd device/lineage/sepolicy && git fetch https://github.com/Legendleo90/device_lineage_sepolicy && git cherry-pick fc4c8fee1d1bf1ff6241fb30285fb2d1b54ed559 && cd ../../..
cd device/qcom/sepolicy_vndr/legacy-um && git fetch https://github.com/Legendleo90/android_device_qcom_sepolicy_vndr && git cherry-pick a4b7e84aabdfed4e8c72257bbe2bffad4b19bee6 47ff8ac2c539f318f885caa5fa531484a56168cb 79f09bc36fb8ca57816e3b05b73c9f118bd12eef 9c7d2991a3581c01f19f6fb54398db23a12ffd09 48f2e4c02df278292aae523c4f5c90ef58ccb6f9 && cd ../../../..

# Build the ROM
lunch custom_beryllium-bp3a-userdebug && m installclean && m pixelos
