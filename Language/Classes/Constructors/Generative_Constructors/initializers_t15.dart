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
 * @description Checks that cascaded invocations are allowed in field
 * initializers.
 * @author rodionov
 */
import "../../../../Utils/expect.dart";

class C {
  C() : this.foo =
      null..[1](1)[2](2).foo(3, bar: 4)[0] = 5..bar(6)["one ugly cascade"] {}
  var foo;
}

main() {
  try {
    new C();
    Expect.fail("NoSuchMethodError expected");
  } on NoSuchMethodError catch (ok) {}
}
