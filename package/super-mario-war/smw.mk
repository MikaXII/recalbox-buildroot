################################################################################
#
# super-mario-war
#
################################################################################

SUPER_MARIO_WAR_VERSION = 5aa32d40a395a56f69b83deea7400fdef565b37b
SUPER_MARIO_WAR_SITE = $(call github,mmatyas,supermariowar,$(SUPER_MARIO_WAR_VERSION))
SUPER_MARIO_WAR_INSTALL_STAGING = YES
SUPER_MARIO_WAR_DEPENDENCIES = sdl sdl_image sdl_mixer


define SUPER_MARIO_WAR_BUILD_CMDS
	DDISABLE_DEFAULT_CFLAGS=1 CFLAGS="$(TARGET_CFLAGS)" CXXFLAGS="$(TARGET_CXXFLAGS)" $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D) 
endef

#define SUPERMARIOWAR_INSTALL_TARGET_CMDS
	
#endef

$(eval $(cmake-package))
#$(eval $(generic-package))
