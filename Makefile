THEOS_DEVICE_IP = 
TARGET := iphone:clang:latest:7.0


include $(THEOS)/makefiles/common.mk

TWEAK_NAME = tweakaddbutton

tweakaddbutton_FILES = Tweak.x
tweakaddbutton_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
