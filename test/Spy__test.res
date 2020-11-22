open Test

let arrayEquals = (a, b) =>
  assertion(~operator="arrayEquals", (a, b) => Belt.Array.eq(a, b, (a, b) => a == b), a, b)

test("Spy.make", () => {
  let (f, calls) = Spy.make(() => 1)
  arrayEquals([f(), f()], [1, 1])
  arrayEquals(calls, [(), ()])
})

test("Spy.make1", () => {
  let (f, calls) = Spy.make1(x => x * 2)
  arrayEquals([f(1), f(2)], [2, 4])
  arrayEquals(calls, [1, 2])
})

test("Spy.make2", () => {
  let (f, calls) = Spy.make2((x, y) => x * y)
  arrayEquals([f(1, 2), f(2, 3)], [2, 6])
  arrayEquals(calls, [(1, 2), (2, 3)])
})

test("Spy.make3", () => {
  let (f, calls) = Spy.make3((x, y, z) => x * y * z)
  arrayEquals([f(1, 2, 3), f(2, 3, 4)], [6, 24])
  arrayEquals(calls, [(1, 2, 3), (2, 3, 4)])
})

test("Spy.make4", () => {
  let (f, calls) = Spy.make4((a, b, c, d) => (a * b, c, d))
  arrayEquals([f(1, 2, 3, "foo"), f(2, 3, 4, "bar")], [(2, 3, "foo"), (6, 4, "bar")])
  arrayEquals(calls, [(1, 2, 3, "foo"), (2, 3, 4, "bar")])
})

test("Spy.make5", () => {
  let (f, calls) = Spy.make5((a, b, c, d, e) => (a * b, c, d, e))
  arrayEquals(
    [f(1, 2, 3, "foo", ()), f(2, 3, 4, "bar", ())],
    [(2, 3, "foo", ()), (6, 4, "bar", ())],
  )
  arrayEquals(calls, [(1, 2, 3, "foo", ()), (2, 3, 4, "bar", ())])
})

test("Spy.makeU", () => {
  let (f, calls) = Spy.makeU((. ()) => 1)
  arrayEquals([f(.), f(.)], [1, 1])
  arrayEquals(calls, [(), ()])
})

test("Spy.make1U", () => {
  let (f, calls) = Spy.make1U((. x) => x * 2)
  arrayEquals([f(. 1), f(. 2)], [2, 4])
  arrayEquals(calls, [1, 2])
})

test("Spy.make2U", () => {
  let (f, calls) = Spy.make2U((. x, y) => x * y)
  arrayEquals([f(. 1, 2), f(. 2, 3)], [2, 6])
  arrayEquals(calls, [(1, 2), (2, 3)])
})

test("Spy.make3U", () => {
  let (f, calls) = Spy.make3U((. x, y, z) => x * y * z)
  arrayEquals([f(. 1, 2, 3), f(. 2, 3, 4)], [6, 24])
  arrayEquals(calls, [(1, 2, 3), (2, 3, 4)])
})

test("Spy.make4U", () => {
  let (f, calls) = Spy.make4U((. a, b, c, d) => (a * b, c, d))
  arrayEquals([f(. 1, 2, 3, "foo"), f(. 2, 3, 4, "bar")], [(2, 3, "foo"), (6, 4, "bar")])
  arrayEquals(calls, [(1, 2, 3, "foo"), (2, 3, 4, "bar")])
})

test("Spy.make5U", () => {
  let (f, calls) = Spy.make5U((. a, b, c, d, e) => (a * b, c, d, e))
  arrayEquals(
    [f(. 1, 2, 3, "foo", ()), f(. 2, 3, 4, "bar", ())],
    [(2, 3, "foo", ()), (6, 4, "bar", ())],
  )
  arrayEquals(calls, [(1, 2, 3, "foo", ()), (2, 3, 4, "bar", ())])
})

test("Spy.clear", () => {
  let (f, calls) = Spy.make1(x => x * 2)
  arrayEquals([f(1), f(2)], [2, 4])
  Spy.clear(calls)
  arrayEquals([f(3), f(4)], [6, 8])
  arrayEquals(calls, [3, 4])
})
