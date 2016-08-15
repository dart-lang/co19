/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * initializers:
 *   ':' superCallOrFieldInitializer (', ' superCallOrFieldInitializer)*
 * ;
 * superCallOrFieldInitializer:
 *   super arguments  | super '.' identifier arguments | fieldInitializer
 * ;
 * fieldInitializer:
 *   (this '.')? identifier '=' conditionalExpression cascadeSection*
 * ;
 * @description Checks that it is a compile-time error when identifier in an
 * initializer references an explicit setter method rather than a variable.
 * @compile-error
 * @author iefremov
 */

class C {
  C() : this.x = null {}

  void set x(var v) {
    throw v;
  }
}

main() {
  try {
    new C();
  } catch (v) {}
}

