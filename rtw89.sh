#!/bin/bash

#This is a script to fix some wifi issues with the rtw89 drivers on some hp and lenovo laptops.
#The wifi seems to be getting turned off on its own after a few minutes when using a realtek wifi card.

sudo cp ./70-rtw89.conf /usr/lib/modprobe.d/70-rtw89.conf
