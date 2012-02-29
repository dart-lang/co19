/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion An equality expression of the form e1 !== e2 is equivalent 
 * to the expression !(e1 !== e2).
 * @description Checks that expression of the form e1 !== e2 is equivalent
 * to the expression !(e1 !== e2).
 * @author msyabro
 * @reviewer kaigorodov
 */

class S {
  const S();
}

main() {
  var o = new Object();

  Expect.isFalse(1 !== 1);
  Expect.isFalse((1 - 1) !== 0);
  Expect.isFalse(double.NAN !== double.NAN);
  Expect.isFalse(true !== true);
  Expect.isFalse(false !== false);
  Expect.isFalse(const [1, 2, 3] !== const [1, 2, 3]);
  Expect.isFalse(const {"key": 1} !== const {"key": 1});
  Expect.isFalse("string" !== "string");
  Expect.isFalse("a" !== 'a');
  Expect.isFalse(o !== o);
  Expect.isFalse(const S() !== const S());

  Expect.isTrue(o !== new Object());
  Expect.isTrue([] !== []);
  Expect.isTrue({} !== {});
  Expect.isTrue("ab" !== "ac");
  Expect.isTrue((){} !== (){});
}
