##-*- makefile -*-############################################################
#
# Copyright (C) 2026 MicroEmacs User.
#
# All rights reserved.
#
# Synopsis:    
# Authors:     MicroEmacs User
#
##############################################################################

CURRENT_MAKEFILE := $(lastword $(MAKEFILE_LIST))

## argument delegation
ARGS=

## default: list existing tasks 
.PHONY: tasks
tasks:  ## list all tasks
	@grep -Eo '^[a-z0-9]+:.+' $(CURRENT_MAKEFILE) | sed -E 's/:\s+##/\t- /g'

dia2file: ## run test examples in the tests folder
	cd tests && bash ../bin/dia2file.sh graphviz.dot
	cd tests && bash ../bin/dia2file.sh parser.d2
	cd tests && bash ../bin/dia2file.sh mermaid.mmd
	
	
