// Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Execution of an assert statement assert(e);
/// proceeds as follows:
/// The conditional expression e is evaluated to an object o. If the class of o
/// is a subtype of Function then let r be the result of invoking o with no
/// arguments. Otherwise, let r be o. It is a dynamic type error if o is not of
/// type bool or of type Function, or if r is not of type bool. If r is false,
/// we say that the assertion failed. If r is true, we say that the assertion
/// succeeded. If the assertion succeeded, execution of the assert statement is
/// complete. If the assertion failed, an AssertionError is thrown.
/// @description Checks that a assertion error occurs if the conditional
/// expression e evaluates to false and has correct message.
/// @author sgrekhov@unipro.ru


import '../../../Utils/expect.dart';

main() {
  if (assertStatementsEnabled) {
    dynamic n = null;
    if(hasSoundNullSafety) {
      Expect.throws(() {
        assert(n);
      }, (e) => e is TypeError);
    } else {
      Expect.throws(() {
        assert(n);
      }, (e) => e is AssertionError);
    }

    Expect.throws(() {
      assert(false, "Some message");
    }, (e) => e is AssertionError, "Some message");

    Expect.throws(() {
      assert(false, 123);
    }, (e) => e is AssertionError, "123");

    Expect.throws(() {
      assert(false, 3.14);
    }, (e) => e is AssertionError, 3.14.toString());

    var o = new Object();
    Expect.throws(() {
      assert(false, o);
    }, (e) => e is AssertionError, o.toString());
  }
}
