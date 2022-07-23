# GENERAL MACROS
SHELL  := /bin/bash
RM     := rm -rf
MKDIR  := mkdir -p
MV     := mv -f
LN     := ln -f -s
RMDIR  := rmdir
CP     := cp -f -av
SED    := sed  -i'' -e
STRIP  := strip
TAR    := tar -cf
GZIP   := gzip -9f

# COLORS
RED     := 1
GREEN   := 2
YELLOW  := 3
BLUE    := 4
MAGENTA := 5
CYAN    := 6
WHITE   := 7

# LOGGERS --> Example: $(call log-warning,'This is a warning')
define log-colored
	tput bold && tput setaf $1 && echo -en $2 && tput sgr0
endef

define log-warning
	$(call log-colored,${YELLOW},$1)
endef

define log-error
	$(call log-colored,${RED},$1)
endef

define log-success
	$(call log-colored,${GREEN},$1)
endef

define log-info
	$(call log-colored,${BLUE},$1)
endef

define log-regular
	$(call log-colored,${WHITE},$1)
endef

define log-target
	$(call log-colored,${MAGENTA},$1)
endef

# TARGETS
default: usage

help: usage

usage:
	$(call log-target, 'Available targets:\n')
	$(call log-regular,'    $$ make install: Symlinks the dotfiles to $$HOME\n')
	$(call log-regular,'    $$ make uninstall: Removes the symlinks to the dotfiles \n')
	exit 0

install: force
	$(call log-target,'Installing dotfiles...\n')
	./install.sh

uninstall: force
	$(call log-target,'Uninstalling dotfiles...\n')
	./uninstall.sh

# depend on this fake target to cause a target to always run
force: ;

# this target silences echoing of any target which has it as a dependency.
.SILENT: