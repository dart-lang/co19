/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Evaluation of an equality expression ee of the form e1 === e2
 * proceeds as follows:
 *   The expression e1 is evaluated to an object o1; then the expression e2 is
 *   evaluated to an object o2. Next, if o1 and o2 are the same object, then ee
 *   evaluates to true, otherwise ee evaluates to false.
 * @description Checks that an expression of the form e1 === e2 evaluated correctly.
 * @author msyabro
 * @reviewer kaigorodov
 */

class S {
  const S();
}

main() {
  var o = new Object();

  Expect.isTrue(1 === 1);
  Expect.isTrue((1 - 1) === 0);
  Expect.isTrue(double.NAN === double.NAN);
  Expect.isTrue(true === true);
  Expect.isTrue(false === false);
  Expect.isTrue(const [1, 2, 3] === const [1, 2, 3]);
  Expect.isTrue(const {"key": 1} === const {"key": 1});
  Expect.isTrue("string" === "string");
  Expect.isTrue("a" === 'a');
  Expect.isTrue(o === o);
  Expect.isTrue(const S() === const S());
  Expect.isTrue(null === null);

  Expect.isFalse(o === new Object());
  Expect.isFalse([] === []);
  Expect.isFalse({} === {});
  Expect.isFalse(1 === 2);
  Expect.isFalse((){} === (){});
}
