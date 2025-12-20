rm -rf .repo/local_manifests/ 
repo init -u https://github.com/halcyonproject/manifest.git -b 16.0 --git-lfs 
 git clone https://github.com/ibraaltabian17/local_manifest.git --depth 1 -b halcyon-16 .repo/local_manifests &&  
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

# Build the ROM
lunch halcyon_beryllium-bp2a-userdebug && mka carthage
