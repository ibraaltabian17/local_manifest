rm -rf .repo/local_manifests/ 
repo init -u https://github.com/halcyonproject/manifest.git -b 16.0 --git-lfs 
 git clone https://github.com/ibratabian17/local_manifests.git --depth 1 -b halcyon-16 .repo/local_manifests &&  
# Sync the repositories
if [ -f /usr/bin/resync ]
 then
  /usr/bin/resync 
else
  /opt/crave/resync.sh
fi && 
# Set up build environment
export BUILD_USERNAME=ibratabian17 
 export BUILD_HOSTNAME=crave 
 source build/envsetup.sh

# Hax
cd packages/modules/Connectivity 
git fetch https://github.com/LineageOS/android_packages_modules_Connectivity refs/changes/72/452772/1 && git cherry-pick FETCH_HEAD
cd ../../../hardware/lineage/compat
git fetch https://github.com/yaap/hardware_lineage_compat/ && git cherry-pick ff324381288b4e097e22dc523eb2e28b5eb14f56
cd ../../../system/core
git remote add fix https://github.com/AxionAOSP/android_system_core && git cherry-pick 927eOd126f912c88b4253f18ab 2913b8749ab1d3
cd ../../

# Build the ROM
lunch halcyon_beryllium-bp2a-userdebug && mka carthage