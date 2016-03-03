/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Otherwise, control is transferred to the nearest innermost
 * enclosing exception handler.
 * @description Checks that an expression statement of the form "rethrow;"
 * indeed transfers control to the nearest enclosing exception handler if there
 * is one, leaving the current exception and stack trace unchanged.
 * @author rodionov
 * @reviewer iefremov
 */
import '../../../Utils/expect.dart';

String ex = "";
StackTrace st1 = null;

test() {
  try {
    throw "ex";
    Expect.fail("This code shouldn't be executed");
  } on int catch (i) {
  } on String catch (s, st) {
    ex = s;
    st1 = st;
    rethrow;
    Expect.fail("This code shouldn't be executed");
  }
  Expect.fail("This code shouldn't be executed");
}

main() {
  try {
    test();
  } on String catch (e, st) {
    Expect.identical(e, ex);
    Expect.identical(st, st1);
  } catch (e) {
    Expect.fail("This code shouldn't be executed");
  }
}
