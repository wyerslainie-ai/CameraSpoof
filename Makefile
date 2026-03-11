TARGET := iphone:clang:latest:15.0
THEOS_PACKAGE_SCHEME = roothide

THEOS ?= $(HOME)/theos
include $(THEOS)/makefiles/common.mk

TWEAK_NAME = CameraSpoofer
CameraSpoofer_FILES = Tweak.xm
CameraSpoofer_FRAMEWORKS = UIKit
CameraSpoofer_CFLAGS = -fobjc-arc

include $(THEOS)/makefiles/tweak.mk
