# lfe-clean

*The LFE rebar3 clean plugin*

[lr3-logo]: resources/images/logo.png

[![][lr3-logo]][lr3-logo]


#### Contents

* [Build](#build-)
* [Use](#use-)


## Build [&#x219F;](#contents)


```bash
    $ rebar3 compile
```


## Use [&#x219F;](#contents)

Add the required plugins and provider hooks to your ``rebar.config``:

```erlang
{plugins, [
  {'lfe-compile', ".*",
    {git, "https://github.com/lfe-rebar3/compile.git", {tag, "0.2.1"}}},
  {'lfe-clean', ".*",
    {git, "https://github.com/lfe-rebar3/clean.git", {tag, "0.1.0"}}}
]}.

{provider_hooks, [
   {pre, [{compile, {lfe, compile}}]}
  ]}.
```

Then just call your plugin directly from your project directory:

```bash
$ rebar3 help lfe clean

The LFE rebar3 clean plugin.

Remove files not removed by 'rebar3 clean'.


Usage: rebar3 lfe clean
...
```

```bash
$ rebar3 lfe clean
...
```
