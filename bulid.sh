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

# Build the ROM
lunch custom_beryllium-bp3a-userdebug && m installclean && m pixelos
