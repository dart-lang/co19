// Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/**
 * @assertion Error thrown when a lazily initialized variable cannot be
 * initialized.
 * A static/library variable with an initializer expression is initialized the
 * first time it is read. If evaluating the initializer expression causes
 * another read of the variable, this error is thrown.
 *
 * @description
 * From https://github.com/dart-lang/language/blob/master/accepted/future-releases/nnbd/feature-specification.md#late-fields-and-variables:
 * If a variable or field is read from during the process of evaluating its own
 * initializer expression, and no write to the variable has occurred, the read
 * is treated as a first read and the initializer expression is evaluated again.
 *
 * A toplevel or static variable with an initializer is evaluated as if it was
 * marked [late]. Note that this is a change from pre-NNBD semantics in that:
 *
 * Throwing an exception during initializer evaluation no longer sets the
 * variable to [null]
 *
 * Reading the variable during initializer evaluation is no longer checked for,
 * and does not cause an error.
 *
 * The test checks that if evaluating the initializer expression causes
 * another read of the variable, then [CyclicInitializationError] is not thrown
 * and [StackOverflowError] happens instead.
 * @Issue 42470
 * @issue 42893
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

class C {
  static var x = f();
  static f() => x + 1;
}

main() {
  try {
    C.x;
    Expect.fail("StackOverflowError should be thrown");
  } on CyclicInitializationError catch (e) {
    Expect.fail("StackOverflowError should be thrown");
  } on Error catch (e) {
    // See https://github.com/dart-lang/sdk/issues/42893
  }
}
