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
/// @description Checks that a finally statement is executed if the control
/// is transferred from a try block using a return statement.
/// @author iefremov

import '../../../Utils/expect.dart';

foo() {
  try {
    return 1;
  } finally {
    return 2;
  }
}

main() {
  Expect.equals(2, foo(), "A finally clause was not executed correctly!");
}
