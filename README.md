# rk3506-rkr4.2-sdk

# Prerequisites
Note: WSL is not supported.
```
sudo apt update && sudo apt-get upgrade -y
sudo apt install -y git gcc g++ make libncurses5-dev libssl-dev bc bison flex build-essential libncursesw5-dev device-tree-compiler libglib2.0-dev wget cpio unzip rsync file python3 bc build-essential libncurses5-dev libncursesw5-dev make bc bison flex
```

## Compilation steps

### Select profile

Enter the top-level directory of SDK source code, execute the following command, and select the board level configuration file

```
./build.sh lunch
1. rockchip_rk3502_robot_defconfig
2. rockchip_rk3506_b_evb1_defconfig
3. rockchip_rk3506_g_demo_defconfig
4. rockchip_rk3506_g_evb1_amp_defconfig
5. rockchip_rk3506_g_evb1_defconfig
6. rockchip_rk3506_g_evb1_smp_defconfig
7. rockchip_rk3506j_armsom_cm1_defconfig
8. rockchip_rk3506j_armsom_forge1_defconfig
```

Choose 7 or 8.



### Compilation

After selecting the board level configuration, compile it completely once directly

```
./build.sh
```

The generated image file is in the `SDK/rockdev` folder

Compile the Uboot:

```
./build.sh uboot
```

Compile the Kernel:

```
./build.sh kernel
```

### Problem discussion

Common issues can be discussed on the [forum](https://forum.armsom.org/c/armsom-cm1/12 "跳转到armsom forum")
