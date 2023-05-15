docs:
	@awk -f ./docsgen.awk ./aliases.sh > README.md

.PHONY: docs
