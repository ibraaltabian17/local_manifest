rm -rf .repo/local_manifests/ 
repo init -u https://github.com/The-Clover-Project/manifest.git -b 16-qpr1 --git-lfs 
git clone https://github.com/ibraaltabian17/local_manifest.git --depth 1 -b clover-16 .repo/local_manifests &&  
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

cd hardware/lineage/compat && git fetch https://github.com/yaap/hardware_lineage_compat && git checkout FETCH_HEAD && cd ../../../

# Build the ROM
lunch clover_beryllium-bp3a-userdebug && mka clover
