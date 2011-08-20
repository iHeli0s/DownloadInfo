include theos/makefiles/common.mk

TWEAK_NAME = DownloadInfo
DownloadInfo_FILES = Tweak.xm
DownloadInfo_FRAMEWORKS = UIKit
include $(THEOS_MAKE_PATH)/tweak.mk
