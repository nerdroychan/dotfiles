#!/bin/bash

sudo mount /dev/sda1 /mnt/win/root
sudo mount /dev/sdb1 /mnt/win/data

qemu-system-x86_64 \
    -machine q35,kernel_irqchip=on,vmport=off \
    -enable-kvm \
    -cpu host,topoext,kvm=off,amd-stibp=off,hv_relaxed,hv_spinlocks=0x1fff,hv_time,hv_vapic,hv_vendor_id=famd,-hypervisor \
    -rtc clock=host,base=localtime \
    -smp cores=16,threads=1,sockets=1 \
    -m 32G,maxmem=32G \
    -mem-prealloc \
    -drive if=pflash,format=raw,readonly=on,file=/usr/share/edk2-ovmf/x64/OVMF_CODE.fd \
    -drive file=/mnt/win/root/root.img,format=raw,if=virtio \
    -drive file=/mnt/win/data/data.img,format=raw,if=virtio \
    -nic user,model=virtio-net-pci \
    -device pcie-root-port,multifunction=on,id=pcie.1,bus=pcie.0,chassis=1,slot=1,port=1 \
    -device vfio-pci,bus=pcie.1,host=11:00.0 \
    -device vfio-pci,bus=pcie.1,host=11:00.1 \
    -nographic -vga none -parallel none -serial none \
    -object input-linux,id=mouse,evdev=/dev/input/by-id/usb-Microsoft_Microsoft®_Classic_IntelliMouse®-event-mouse \
    -object input-linux,id=kbd,evdev=/dev/input/by-id/usb-SONiX_USB_Keyboard-event-kbd,grab_all=on,repeat=on \
    -device ich9-intel-hda,bus=pcie.1,addr=0x1b \
    -device hda-micro,audiodev=pa1 \
    -audiodev pa,id=pa1,server=/run/user/1000/pulse/native

sudo umount /mnt/win/root
sudo umount /mnt/win/data



#    -drive file=/home/chen/Downloads/Win10_21H1_English_x64.iso,media=cdrom \
#    -drive file=/home/chen/Downloads/virtio-win-0.1.208.iso,media=cdrom \
