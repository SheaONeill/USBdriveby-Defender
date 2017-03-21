#!/bin/bash
#
#check if usbhid exists

usb_keyboard=/sys/bus/usb/drivers/usbhid
if [ ! -d $usb_keyboard ]; then
echo "Not a USB HID device"
else
echo "USB HID Device inserted!"
ls -la /sys/bus/usb/drivers/usbhid
udevadm info -a -p /sys/bus/usb/drivers/usbhid
fi
echo "Done"
#ATTRS{idVendor}=="0a81", ATTRS{idProduct}=="0701", OPTIONS=="ignore_device"

#x events: xev | grep keysym
#ref:https://www.x.org/archive/X11R7.7/doc/man/man1/xev.1.xhtml
#Xev creates a window and then asks the X server to send it events whenever #anything happens to the window (such as it being moved, resized, typed in, #clicked in, etc.). You can also attach it to an existing window. It is useful for #seeing what causes events to occur and to display the information that they #contain; it is essentially a debugging and development tool, and should not be #needed in normal usage.

#!/bin/bash
#ref:http://serverfault.com/questions/126291/ubuntu-keyboard-detection-from-bash-script
#For USB, you can search /sys/bus/usb/devices for a device with a configuration #with an interface with class HID (0x03) and protocol Keyboard (0x01).
for dev in /sys/bus/usb/devices/*-*:*
do
  if [ -f $dev/bInterfaceClass ]
  then
    if [[ "$(cat $dev/bInterfaceClass)" == "03" && "$(cat $dev/bInterfaceProtocol)" == "01" ]]
    then
      echo "Keyboard detected: $dev"
    fi
  fi
done
#read this its interesting
#ref:http://www.computerhope.com/unix/ustty.htm
#stty changes and prints terminal line settings.

