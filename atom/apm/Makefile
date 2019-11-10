default: install

bundle:
	@apm list -i --bare > packages
	@cat packages

install:
	@apm install --packages-file packages

uninstall:
	@apm list -i --bare | sed 's/@.*//' | xargs apm uninstall

reinstall: uninstall install

upgrade: update

.PHONY: install update upgrade uninstall bundle
