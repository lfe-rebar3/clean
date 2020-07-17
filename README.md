# DEPRECATED / ARCHIVED

This functionality is now available in the far more streamlined project https://github.com/lfe-rebar3/rebar3_lfe

# lfe-clean

[![Build Status][travis badge]][travis]
[![LFE Versions][lfe badge]][lfe]
[![Erlang Versions][erlang badge]][versions]
[![Tags][github tags badge]][github tags]
[![Downloads][hex downloads]][hex package]

[![][lr3-logo]][lr3-logo]

*The LFE rebar3 clean plugin*


#### Contents

* [Build](#build-)
* [Use](#use-)
* [License](#license-)


## Build [&#x219F;](#contents)


```bash
    $ rebar3 compile
```


## Use [&#x219F;](#contents)

Add the required plugins and provider hooks to your ``rebar.config``:

```erlang
{plugins, [
  {'lfe-compile', ".*",
    {git, "https://github.com/lfe-rebar3/compile.git", {branch, "master"}}},
  {'lfe-clean', ".*",
    {git, "https://github.com/lfe-rebar3/clean.git", {branch, "master"}}}
]}.

{provider_hooks, [
   {pre, [{compile, {lfe, compile}}]}
  ]}.
```

While the above example shows the use of the master branch, you may want to 
pin to a specific tag instead.

Then just call your plugin directly from your project directory:

```bash
$ rebar3 help lfe clean

The LFE rebar3 clean plugin.

Delete files not removed by 'rebar3 clean'.
This operation is destructive! It will delete files
and recursively remove the configured directories!


Usage: rebar3 lfe clean
```

```bash
$ rebar3 lfe clean

===> Cleaning up files and directories
 ~~>    Removing file /home/oubiwann/lab/lfe/rebar3/ltool/rebar.lock ...
 ~~>    Removing file /home/oubiwann/lab/lfe/rebar3/ltool/erl_crash.dump ...
 ~~>    Removing directory /home/oubiwann/lab/lfe/rebar3/ltool/_build ...
 ~~>    Removing directory /home/oubiwann/lab/lfe/rebar3/ltool/deps ...
 ~~>    Removing directory /home/oubiwann/lab/lfe/rebar3/ltool/.rebar ...
 ~~>    Removing directory /home/oubiwann/lab/lfe/rebar3/ltool/.rebar3 ...
```


## License [&#x219F;](#contents)

BSD 3-Clause License

Copyright © 2015-2019, Duncan McGreggor <oubiwann@gmail.com>


<!-- Named page links below: /-->

[lr3-logo]: priv/images/logo.png
[org]: https://github.com/lfe-rebar3
[github]: https://github.com/lfe-rebar3/clean
[gitlab]: https://gitlab.com/lfe-rebar3/clean
[travis]: https://travis-ci.org/lfe-rebar3/clean
[travis badge]: https://img.shields.io/travis/lfe-rebar3/clean.svg
[lfe]: https://github.com/rvirding/lfe
[lfe badge]: https://img.shields.io/badge/lfe-1.3.0-blue.svg
[erlang badge]: https://img.shields.io/badge/erlang-17.5%20to%2022.0-blue.svg
[versions]: https://github.com/lfe-rebar3/clean/blob/master/.travis.yml
[github tags]: https://github.com/lfe-rebar3/clean/tags
[github tags badge]: https://img.shields.io/github/tag/lfe-rebar3/clean.svg
[github downloads]: https://img.shields.io/github/downloads/lfe-rebar3/clean/total.svg
[hex badge]: https://img.shields.io/hexpm/v/rebar3_lfe_clean.svg?maxAge=2592000
[hex package]: https://hex.pm/packages/rebar3_lfe_clean
[hex downloads]: https://img.shields.io/hexpm/dt/rebar3_lfe_clean.svg
