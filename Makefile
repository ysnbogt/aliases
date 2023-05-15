docs:
	@awk -f ./docsgen.awk ./aliases.sh > README.md \
	&& make format

format:
	@npx prettier --loglevel silent --write .

.PHONY: docs format
