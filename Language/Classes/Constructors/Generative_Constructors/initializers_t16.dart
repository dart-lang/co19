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
 * @description Checks that an invalid cascaded invocation in a field
 * initializer results in a compile-time error.
 * @compile-error
 * @author rodionov
 */

class C {
  C() : this.foo = null..("arguments without a selector not allowed") {}
  var foo;
}

main() {
  try {
    new C();
  } catch (ok) {}
}
