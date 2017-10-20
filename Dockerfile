FROM timiil/coolsnowwolf-lede-builder
MAINTAINER timiil@163.com

#为扩展R7800可用系统空间，去掉官方netgear分区，需要覆盖此二文件。
#参考: https://forum.lede-project.org/t/tutorial-build-custom-netgear-r7800-firmware-for-a-larger-flash-size-root-space/5989
COPY ./4.4_qcom-ipq8065-r7800.dts /lede/target/linux/ipq806x/files-4.4/arch/arm/boot/dts/qcom-ipq8065-r7800.dts
COPY ./4.9_qcom-ipq8065-r7800.dts /lede/target/linux/ipq806x/files-4.9/arch/arm/boot/dts/qcom-ipq8065-r7800.dts

#构建配置
COPY ./.config /lede/.config

RUN make download

#RUN make -j1 V=s 
