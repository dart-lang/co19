/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Evaluation of a throw expression of the form throw e; proceeds as
 * follows:
 * The expression e is evaluated yielding a value v.
 * If v evaluates to null, then a NullThrownError is thrown. Otherwise, control
 * is transferred to the nearest dynamically enclosing exception handler, with
 * the current exception set to v and the current return value becomes
 * undefined.
 * @description Checks that if exception was raised inside the function and it was
 * not caught in this function, then control is transferred to the nearest
 * dynamically enclosing exception handler and return value becomes undefined.
 * @author ngl@unipro.ru
 */
import '../../../Utils/expect.dart';

int f(int i) {
  if (i == 2) {
    throw new Error();
  }
  return i + 1;
}
main() {
  int r = 0;
  try {
    r = f(3);
    Expect.equals(4, r);
    r = f(2);
  } catch (e) {
    Expect.equals(4, r,
        "Exception was caught: f(2) invocation changes r value");
  }
  Expect.equals(4, r, "f(2) invocation changes r value");
}
