GPU=11:00
GPU_ID="1002 73ff"
GPU_AUDIO_ID="1002 ab28"

# Unbind the GPU from it's drivers
echo -n "0000:${GPU}.0" > /sys/bus/pci/drivers/amdgpu/unbind
echo -n "0000:${GPU}.1" > /sys/bus/pci/drivers/snd_hda_intel/unbind

# Hand over GPU to vfio-pci
echo -n "$GPU_ID" > /sys/bus/pci/drivers/vfio-pci/new_id
echo -n "$GPU_AUDIO_ID" > /sys/bus/pci/drivers/vfio-pci/new_id
