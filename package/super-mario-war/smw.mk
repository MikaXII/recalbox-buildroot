################################################################################
#
# super-mario-war
#
################################################################################

SUPER_MARIO_WAR_VERSION = master
SUPER_MARIO_WAR_SITE = $(call github,MikaXII,Super-Mario-War,$(SUPER_MARIO_WAR_VERSION))

define SUPER_MARIO_WAR_BUILD_CMDS
	mkdir $(@D)/build
	$(MAKE) CC="$(TARGET_CC)" LD="$(TARGET_LD)" 
	#CFLAGS= -Wall -I. -DLINUXFUNC -DPREFIXPATH=\"/usr/share/games/smw\" \ 
	#LDFLAGS="$(LDFLAGS)" '`sdl-config --libs` $(LDFLAGS) -lSDL_image -lSDL_mixer -lpng
endef

#define SUPERMARIOWAR_INSTALL_TARGET_CMDS
	
#endef

$(eval $(generic-package))
