/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile-time error if a return statement of the form
 * return e; appears in a generative constructor.
 * @description Checks that a compile-time error occurs if a return statement
 * of the form return e; appears in a named generative constructor.
 * @compile-error
 * @author rodionov
 * @reviewer iefremov
 */

class C {
  C() {}
  C.foo() { return this; }
}

main() {
  try {
    new C.foo();
  } catch (x) {}
}
