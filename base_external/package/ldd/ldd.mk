################################################################################
#
# ldd - Linux Device Drivers modules
#
################################################################################

LDD_VERSION = 1.0
# Path to your assignment 7 repo (should be cloned next to assignment-5)
LDD_SITE = $(TOPDIR)/../assignment7-dylanzflores
LDD_SITE_METHOD = local

# Subdirectories inside ldd3 to build
LDD_MODULE_SUBDIRS = misc-modules scull

$(eval $(kernel-module))
$(eval $(generic-package))

