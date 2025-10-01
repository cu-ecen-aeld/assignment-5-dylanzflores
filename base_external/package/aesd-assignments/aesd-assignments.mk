##############################################################
#
# AESD-ASSIGNMENTS
#
##############################################################

AESD_ASSIGNMENTS_VERSION = 9c1b77465338cffb91f433ea8c9e33d54b6e7c38
AESD_ASSIGNMENTS_SITE = git@github.com:cu-ecen-aeld/assignments-3-and-later-dylanzflores.git
AESD_ASSIGNMENTS_SITE_METHOD = git
AESD_ASSIGNMENTS_GIT_SUBMODULES = YES

# Debug info for troubleshooting
$(info AESD_ASSIGNMENTS source dir: $(@D))
$(info Building aesdsocket from: $(@D)/server)

# Define subdirectories
AESD_FINDER_APP_DIR = $(@D)/finder-app
AESD_SERVER_DIR = $(@D)/server

# Build commands
define AESD_ASSIGNMENTS_BUILD_CMDS
	$(MAKE) CC=$(TARGET_CC) -C $(AESD_FINDER_APP_DIR) all
	$(MAKE) CC=$(TARGET_CC) -C $(AESD_SERVER_DIR) all
endef

# Install commands
define AESD_ASSIGNMENTS_INSTALL_TARGET_CMDS
	# Install conf files
	$(INSTALL) -d 0755 $(AESD_FINDER_APP_DIR)/conf/ $(TARGET_DIR)/etc/finder-app/conf/
	$(INSTALL) -m 0755 $(AESD_FINDER_APP_DIR)/conf/* $(TARGET_DIR)/etc/finder-app/conf/

	# Install assignment 4 test scripts
	$(INSTALL) -m 0755 $(@D)/assignment-autotest/test/assignment4/* $(TARGET_DIR)/bin

	# Install finder-app scripts and binary
	$(INSTALL) -m 0755 $(AESD_FINDER_APP_DIR)/finder.sh $(TARGET_DIR)/bin/
	$(INSTALL) -m 0755 $(AESD_FINDER_APP_DIR)/finder-test.sh $(TARGET_DIR)/bin/
	$(INSTALL) -m 0755 $(AESD_FINDER_APP_DIR)/writer.sh $(TARGET_DIR)/bin/
	$(INSTALL) -m 0755 $(AESD_FINDER_APP_DIR)/writer $(TARGET_DIR)/bin/

	# Install server binary and init script
	$(INSTALL) -m 0755 $(AESD_SERVER_DIR)/aesdsocket $(TARGET_DIR)/usr/bin/
	$(INSTALL) -D -m 0755 $(AESD_SERVER_DIR)/aesdsocket-start-stop $(TARGET_DIR)/etc/init.d/S99aesdsocket
endef

# Evaluate package
$(eval $(generic-package))

