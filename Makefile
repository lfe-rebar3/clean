make:
	rebar3 compile

clean:
	rm -rf .rebar .rebar3 deps _build rebar.lock \
	ebin/* \
	$(HOME)/.cache/rebar3/hex/default/packages/*

push:
	git push github master
	git push gitlab master

push-tags:
	git push github --tags
	git push gitlab --tags

push-all: push push-tags

build-github: clean
	@echo
	@echo "============================="
	@echo "Building using Github Sources ..."
	@echo "============================="
	@echo
	rebar3 compile
	rebar3 lock

build-gitlab: clean
	@echo
	@echo "============================="
	@echo "Building using Gitlab Sources ..."
	@echo "============================="
	@echo
	rebar3 as gitlab compile
	rebar3 as gitlab lock

build-hexpm: clean
	@echo
	@echo "=============================="
	@echo "Building using Hex.pm Packages ..."
	@echo "=============================="
	@echo
	rebar3 as hexpm compile
	rebar3 as hexpm lock

build-all: build-github build-gitlab build-hexpm

publish: clean
	rebar3 as hexpm lock
	rebar3 as hexpm hex publish
