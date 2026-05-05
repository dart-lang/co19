// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The execution of a return statement proceeds as follows.
///
/// Case ⟨Synchronous non-generator functions and factory constructors⟩. Let `s`
/// be a statement of the form `return e;`. Let `f` be the immediately enclosing
/// function, and consider the case where `f` is a synchronous non-generator or
/// a factory constructor. Execution of `s` proceeds as follows.
///
/// The expression `e` is evaluated to an object `o`. A dynamic error occurs
/// unless the dynamic type of `o` is a subtype of the actual return type of `f`.
/// Then the return statement `s` completes returning `o`.
///
/// @description Checks that a `finally` statement is executed if the control is
/// transferred from a try block using a `return` statement.
/// @author iefremov

import '../../../Utils/expect.dart';

var flag = false;

foo() {
  try {
    return 1;
  } finally {
    flag = true;
  }
}

main() {
  foo();
  Expect.isTrue(flag, "Finally clause was not executed!");
}
