/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Otherwise, control is transferred to the nearest innermost
 * enclosing exception handler.
 * @description Checks that the statement of the form "rethrow;" indeed
 * transfers control to the nearest enclosing exception handler if there is one,
 * leaving the current exception unchanged.
 * @note Can not test if the stack trace is unchanged because stack trace
 * equality is unspecified in spec (co19 issue 719)
 * @author rodionov
 * @reviewer iefremov
 */
import '../../../Utils/expect.dart';

main() {
  bool flag = false;
  var strace;
  var ex = "";

  try {
    try {
      void foo() {
        try {
          throw ex;
          Expect.fail("This code shouldn't be executed");
        } on int catch (i) {
        } catch (v, st) {
          strace = st;
          rethrow;
          Expect.fail("This code shouldn't be executed");
        }
        Expect.fail("This code shouldn't be executed");
      }
      foo();
      Expect.fail("This code shouldn't be executed");
    } on int catch (i) {}
    Expect.fail("This code shouldn't be executed");
  } on int catch (i) {
  } catch (s, st) {
    flag = true;
    Expect.isTrue(identical(ex, s));
    Expect.isTrue(identical(strace, st)); // see note
  }

  Expect.isTrue(flag, "The correct exception handler wasn't triggered");
}
