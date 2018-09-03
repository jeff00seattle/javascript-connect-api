#
# Makefile
#

version:
	@echo "======================================================"
	@echo version
	@echo "======================================================"
	node --version
	npm --version

list:
	@echo "======================================================"
	@echo list targets
	@echo "======================================================"
	cat Makefile | grep "^[a-z]" | awk '{print $$1}' | sed "s/://g" | sort