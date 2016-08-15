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
 * @description Checks that it is a compile-time error when a field initializer
 * does not include the actual assignment in addition to the field identifier.
 * @compile-error
 * @author iefremov
 */

class C {
  C() : x {}
  var x;
}

main() {
  try {
    new C();
  } catch (x) {}
}
