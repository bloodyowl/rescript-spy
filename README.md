# ReScript Spy

> Test utility to check function calls

## Install

```console
$ yarn add rescript-spy
```

Then, add it to you're `bsconfig.json`'s dev dependencies:

```diff
 "bs-dev-dependencies": [
+   "rescript-spy"
 ]
```

## Usage

```rescript
let (spy, calls) = Spy.make2((a, b) => a + b)

let _ = spy(1, 2)
let _ = spy(2, 3)

calls // [(1, 2), (2, 3)]
Spy.clear(calls)

let _ = spy(3, 4)
calls // [(3, 4)]
```
