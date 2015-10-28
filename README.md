# lfe-clean

*The LFE rebar3 'clean' plugin*

<img src="resources/images/logo.png" />


## Build


```bash
    $ rebar3 compile
```


## Use

Add the plugin to your ``rebar.config``:

```erlang
{plugins, [
  {'lfe-clean', ".*",
    {git, "https://github.com/lfe-rebar3/clean.git",
      {branch, "master"}}}
]}.
```

Then just call your plugin directly from your project directory:

```bash
$ rebar3 help lfe clean
...
```

```bash
$ rebar3 lfe clean
...
```
