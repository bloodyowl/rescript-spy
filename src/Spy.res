let make = func => {
  let calls = []
  let func = () => {
    let _ = calls->Js.Array2.push()
    func()
  }
  (func, calls)
}

let make1 = func => {
  let calls = []
  let func = a => {
    let _ = calls->Js.Array2.push(a)
    func(a)
  }
  (func, calls)
}

let make2 = func => {
  let calls = []
  let func = (a, b) => {
    let _ = calls->Js.Array2.push((a, b))
    func(a, b)
  }
  (func, calls)
}

let make3 = func => {
  let calls = []
  let func = (a, b, c) => {
    let _ = calls->Js.Array2.push((a, b, c))
    func(a, b, c)
  }
  (func, calls)
}

let make4 = func => {
  let calls = []
  let func = (a, b, c, d) => {
    let _ = calls->Js.Array2.push((a, b, c, d))
    func(a, b, c, d)
  }
  (func, calls)
}

let make5 = func => {
  let calls = []
  let func = (a, b, c, d, e) => {
    let _ = calls->Js.Array2.push((a, b, c, d, e))
    func(a, b, c, d, e)
  }
  (func, calls)
}

let makeU = func => {
  let calls = []
  let func = (. ()) => {
    let _ = calls->Js.Array2.push()
    func(.)
  }
  (func, calls)
}

let make1U = func => {
  let calls = []
  let func = (. a) => {
    let _ = calls->Js.Array2.push(a)
    func(. a)
  }
  (func, calls)
}

let make2U = func => {
  let calls = []
  let func = (. a, b) => {
    let _ = calls->Js.Array2.push((a, b))
    func(. a, b)
  }
  (func, calls)
}

let make3U = func => {
  let calls = []
  let func = (. a, b, c) => {
    let _ = calls->Js.Array2.push((a, b, c))
    func(. a, b, c)
  }
  (func, calls)
}

let make4U = func => {
  let calls = []
  let func = (. a, b, c, d) => {
    let _ = calls->Js.Array2.push((a, b, c, d))
    func(. a, b, c, d)
  }
  (func, calls)
}

let make5U = func => {
  let calls = []
  let func = (. a, b, c, d, e) => {
    let _ = calls->Js.Array2.push((a, b, c, d, e))
    func(. a, b, c, d, e)
  }
  (func, calls)
}

@set external clear: (array<'a>, @as(0) _) => unit = "length"
