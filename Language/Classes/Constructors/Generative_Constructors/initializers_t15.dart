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
 * @author rodionov,
 * @author sgrekhov@unipro.ru
 */
import "../../../../Utils/expect.dart";

class C {
  var foo;
  static var _x = new List<int>();

  C() : this.foo = _x
    ..add(1)
    ..add(2);
}

main() {
  Expect.listEquals([1, 2], new C().foo);
}
