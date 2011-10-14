/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Operator === only tests for object identity.
 * @description Checks identical operands.
 * @author pagolubev
 * @reviewer iefremov
 */

class A {
  const A(this.x);
  final int x;
}


main() {
  Expect.isTrue(12 === 12);
  Expect.isTrue(const A(1) === const A(1));
  var a1 = new A(1);
  Expect.isTrue(a1 === a1);
  var a2 = a1;
  Expect.isTrue(a1 === a2);
  Expect.isTrue(a2 === a1);
  var a3 = a2;
  Expect.isTrue(a1 === a3);

  Expect.isTrue(null === null);
  Expect.isTrue(true === true);
  Expect.isTrue(false === false);
}
