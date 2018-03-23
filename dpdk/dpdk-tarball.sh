cur_path=$PWD
echo $cur_path

name=dpdk
r=stable
version=17.05.2
prefix=".tar.xz"
dpdk_home=$name-$r-$version
dpdk_xz=$name-$version$prefix

#target_dir=deb/_build
target_dir=./

cd $target_dir
rm -rf $dpdk_home/$RTE_TARGET
tar -jcf $dpdk_xz $dpdk_home

cd $cur_path
mv $target_dir/$dpdk_xz .

md5sum $dpdk_xz
