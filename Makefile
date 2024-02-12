docs:
	@awk -f ./docsgen.awk ./aliases.sh > README.md \
	&& make format

format:
	@npx prettier --log-level silent --write .

.PHONY: docs format
