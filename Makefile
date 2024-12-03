#
#  Author: Hari Sekhon
#  Date: 2024-11-25 01:37:51 +0700 (Mon, 25 Nov 2024)
#
#  vim:ts=4:sts=4:sw=4:noet
#
#  https://github.com/HariSekhon/Environments
#
#  If you're using my code you're welcome to connect with me on LinkedIn and optionally send me feedback
#
#  https://www.linkedin.com/in/HariSekhon
#

ifneq ("$(wildcard bash-tools/Makefile.in)", "")
	include bash-tools/Makefile.in
endif

REPO := HariSekhon/Environments

CODE_FILES := $(shell git ls-files | grep -E -e '\.sh$$' -e '\.py$$' | sort)

.PHONY: default
default: build
	$(MAKE) allow

.PHONY: build
build: init
	@echo ==================
	@echo Environments Build
	@echo ==================
	@$(MAKE) git-summary
	@echo
	bash-tools/packages/install_packages_if_absent.sh direnv || \
	bash-tools/install/install_direnv.sh
	@echo
	@echo "Remember to add this to your .bashrc and reload your shell for direnv to work:"
	@echo
	@echo 'eval "$$(direnv hook bash)"'
	@echo

.PHONY: init
init:
	@echo
	@echo "running init:"
	git submodule update --init --recursive
	@echo

.PHONY: install
install: build
	@:

.PHONY: allow
allow:
	@find . -type f -name .envrc | \
	sed '/bash-tools/d' | \
	while read -r path; do \
		echo "Approving: $$path" && \
		direnv allow "$$path"; \
	done

.PHONY: test
test:
	bash-tools/checks/check_all.sh

#.PHONY: clean
#clean:
#    @rm -fv -- *.pyc *.pyo
