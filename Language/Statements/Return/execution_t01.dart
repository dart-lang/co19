// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Executing a return statement `return e;` proceeds as follows:
///
/// When `f` is a synchronous non-generator, evaluation proceeds as follows:
/// The expression `e` is evaluated to an object `o`. A dynamic error occurs
/// unless the dynamic type of `o` is a subtype of the actual return type of `f`.
/// Then the return statement `s` completes returning `o`.
///
/// When `f` is an asynchronous non-generator with future value type `T`,
/// evaluation proceeds as follows:
/// The expression `e` is evaluated to an object `o`. If the run-time type of
/// `o` is a subtype of `Future<T>`,let `v` be a fresh variable bound to `o` and
/// evaluate `await v` to an object `r`; otherwise let `r` be `o`. A dynamic
/// error occurs unless the dynamic type of `r` is a subtype of the actual value
/// of `T`. Then the return statement `s` completes returning `r`.
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
    bar(new A());
    Expect.fail("Exception expected when evaluating a return statement!");
  } on int catch (ok) {}
}
