GPU=11:00
GPU_ID="1002 73ff"
GPU_AUDIO_ID="1002 ab28"

# remove pcie dev
echo "1" > /sys/bus/pci/devices/"0000:${GPU}.0"/remove
echo "1" > /sys/bus/pci/devices/"0000:${GPU}.1"/remove
sleep 1

# remove id
echo -n "$GPU_ID" > /sys/bus/pci/drivers/vfio-pci/remove_id
echo -n "$GPU_AUDIO_ID" > /sys/bus/pci/drivers/vfio-pci/remove_id

sleep 1

# add back to default driver
echo "1" > /sys/bus/pci/rescan
