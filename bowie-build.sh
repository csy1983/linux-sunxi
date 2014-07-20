[ -e .config ] || cp bowie-cb2.config .config
rm -rf output
make uImage CROSS_COMPILE=arm-linux-gnueabihf- -j2 ARCH=arm
make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- -j2 INSTALL_MOD_PATH=output modules
make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- -j2 INSTALL_MOD_PATH=output modules_install
rm output/lib/modules/*/build output/lib/modules/*/source
mv arch/arm/boot/uImage output
