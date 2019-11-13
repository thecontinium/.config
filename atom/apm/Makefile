ifndef $(packages)
	packages=all
endif

default: install

bundle:
	@apm list -i --bare > bundle

list: bundle
	@cat bundle

install:
	@rm -f all.packages
	@cat *.packages > all.packages
	@apm install --packages-file $(packages).packages

uninstall: bundle
	@rm -f all.packages
	@cat *.packages > all.packages
	@cat bundle | sed 's/@.*//' > .bundle-no-version
	@cat $(packages).packages | sed 's/@.*//;/^ *$$/d'> .$(packages)-no-version
	@grep -Fxf .$(packages)-no-version .bundle-no-version | xargs apm uninstall

remove: bundle
	@cat bundle | sed 's/@.*//' | xargs apm uninstall

reinstall: uninstall install

update:
	@apm update

upgrade: update

.PHONY: install update upgrade uninstall bundle
