// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Executing a return statement `return e;` proceeds as follows:
/// First the expression `e` is evaluated, producing an object `o`. Let `S` be
/// the run-time type of `o` and let `T` be the actual return type of `f`. If
/// the body of `f` is marked `async` and `S` is a subtype of
/// `Future<flatten(T)>` then let `r` be the result of evaluating `await v`
/// where v is a fresh variable bound to `o`. Otherwise let `r` be `o`. Then the
/// return statement returns the object `r`.
///
/// Let `U` be the run-time type of `r`.
/// - If the body of `f` is marked `async` it is a dynamic type error if
///   `Future<U>` is not a subtype of `T`.
/// - Otherwise, it is a dynamic type error if `U` is not a subtype of `T`.
///
/// Executing a return statement with no expression, `return;` returns without
/// an object.
///
/// @description Checks that the return statement returns a value received after
/// evaluating the return expression and if this evaluation results in a runtime
/// exception the control is transferred to the appropriate handler.
/// @author vasya

import '../../../Utils/expect.dart';

foo(x, y) {
  return (x + y);
}

bar(x) {
  return x.run();
}

class A {
  run() {
    throw 1;
  }
}

main() {
  Expect.equals(3, foo(1, 2));
  Expect.equals("foobar", foo("foo", "bar"));

  try {
    Expect.equals(100, bar(new A())); // can't be true, can it?
    Expect.fail("Exception expected when evaluating a return statement!");
  } on int catch (ok) {}
}
