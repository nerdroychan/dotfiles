#!/bin/bash

sudo ./gpu-before.sh
sleep 1
./start-vm.sh
sleep 1
sudo ./gpu-after.sh
