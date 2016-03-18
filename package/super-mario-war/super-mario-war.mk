################################################################################
#
# super-mario-war
#
################################################################################

SUPER_MARIO_WAR_VERSION = master #5aa32d40a395a56f69b83deea7400fdef565b37b
#SUPER_MARIO_WAR_SITE = $(call github,mmatyas,supermariowar,$(SUPER_MARIO_WAR_VERSION))
SUPER_MARIO_WAR_SITE = https://github.com/mmatyas/supermariowar.git
SUPER_MARIO_WAR_INSTALL_STAGING = YES
SUPER_MARIO_WAR_DEPENDENCIES = sdl sdl_image sdl_mixer zlib #enet yaml-cpp
SUPER_MARIO_WAR_CONF_OPTS = 

define SUPER_MARIO_WAR_EXTRACT_CMDS
	rm -rf $(@D)
	(git clone --depth 1 $(SUPER_MARIO_WAR_SITE) $(@D) && \
  	cd $(@D) && \
	git checkout $(SUPER_MARIO_WAR_VERSION) && \
	git submodule init && \
	git submodule update)
	touch $(@D)/.stamp_downloaded
endef

define SUPER_MARIO_WAR_CONFIGURE_CMDS
	mkdir $(@D)/build && \
	cd $(@D)/build && \
	cmake ..
endef

define SUPER_MARIO_WAR_BUILD_CMDS
	$(MAKE) DDISABLE_DEFAULT_CFLAGS=1 CFLAGS="$(TARGET_CFLAGS)" CXXFLAGS="$(TARGET_CXXFLAGS)" CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D)/build 
endef

#define SUPERMARIOWAR_INSTALL_TARGET_CMDS
	
#endef

$(eval $(cmake-package))
#$(eval $(generic-package))
