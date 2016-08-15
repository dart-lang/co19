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
 * initializer references an instance method rather than a variable.
 * @compile-error
 * @author rodionov
 */

typedef void Foo();

class C {
  C() : bar = null {}

  void bar() {}
}

main() {
  try {
    new C();
  } catch (v) {}
}

