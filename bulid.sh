rm -rf .repo/local_manifests/ 
rm -rf device/
rm -rf vendor/
rm -rf kernel/
repo init -u https://github.com/PixelOS-AOSP/android_manifest.git -b sixteen-qpr2 --git-lfs
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
export KBUILD_BUILD_HOST=ibragtg
source build/envsetup.sh

# Patches for Kernel 4.19 
# Hals
rm -rf hardware/qcom-caf/sdm845/display
rm -rf hardware/qcom-caf/sdm845/audio
git clone https://github.com/duckyduckG/android_hardware_qcom_display -b lineage-23.2-caf-sm8250 hardware/qcom-caf/sdm845/display
git clone https://github.com/duckyduckG/android_hardware_qcom_audio -b lineage-23.2-caf-sm8250 hardware/qcom-caf/sdm845/audio

# Qcom-caf
cd hardware/qcom-caf/common && git fetch https://github.com/Dheeraj3031A/voltage_hardware_qcom-caf_common && git cherry-pick bd37399fed6856aba248b05c504ec027be2f3012 d51e482012b000cbd05b2a320606166ede5b6a68 fd8c59f63058ac0aa6471c5db05861f3fd57cc51 dd0418778fdcda21397542c4637a8abcc3303dfc && cd ../../..

# Sepolicy
cd device/lineage/sepolicy && git fetch https://github.com/Legendleo90/device_lineage_sepolicy && git cherry-pick fc4c8fee1d1bf1ff6241fb30285fb2d1b54ed559 && cd ../../..

cd device/qcom/sepolicy_vndr/legacy-um && git fetch https://github.com/Dheeraj3031A/device_qcom_sepolicy_vndr_legacy-um && git cherry-pick 7ca800f7aed1a52819dd60740c47d35e40636692 94f07a606c9fc2d9d141088513b699b396894c97 352bcc6377123ebb8e62a8e846c6c308e02e05d7 26c38c519355d9bba6a33b3fe53dd99d4172a07b 0c8ea2179ec825d32c9abc3e2326e46656f7094e && cd ../../../..


# Build the ROM
lunch custom_beryllium-bp3a-userdebug && m installclean && m pixelos
