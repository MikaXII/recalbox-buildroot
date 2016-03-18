################################################################################
#
# super-mario-war
#
################################################################################

SUPER_MARIO_WAR_VERSION = 1.8
SUPER_MARIO_WAR_SITE = $(call github,mmatyas,supermariowar,$(SUPER_MARIO_WAR_VERSION))
SUPER_MARIO_WAR_DEPENDENCIES = sdl sdl_image sdl_mixer zlib #enet yaml-cpp

define SUPER_MARIO_WAR_BUILD_CMDS
	mkdir $(@D)/build
	$(MAKE) CFLAGS="$(TARGET_CFLAGS)" CXXFLAGS="$(TARGET_CXXFLAGS)" CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D) smw
endef

#define SUPERMARIOWAR_INSTALL_TARGET_CMDS
	
#endef

#$(eval $(cmake-package))
$(eval $(generic-package))
