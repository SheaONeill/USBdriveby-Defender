#!/bin/bash
cd /root/Desktop
echo "Device Removed"
echo "last 5 modified files:"
product=$(cat /root/Desktop/udevadm_info | tail -1)
vendor=$(cat /root/Desktop/udevadm_info | head -1)
#
echo "Vendor $vendor Product $product"

ls -Art | tail -n5
