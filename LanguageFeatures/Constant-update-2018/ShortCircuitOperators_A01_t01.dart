/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The [&&] operator is now short-circuit in constant and potentially
 * constant expressions. It only attempts to evaluate the second operand if the
 * first operand evaluates to [true]. This makes [false && (null as
 * String).length] a valid constant expression. The second operand expression
 * still needs to be a potentially constant expression, which is a new use of
 * potentially constant expressions outside of [const] constructor initializer
 * lists.
 * @description Checks that [&&] does not attempt to calculate the second
 * operand of [&&] operation if the first one is [false] in the constant
 * expression.
 * @author iarkh@unipro.ru
 */
import "../../Utils/expect.dart";

const int i = 25;
const dynamic nil = null;

class MyClass1 {
  final bool b;
  const MyClass1() : b = false && (null as String).length < 12;
}

class MyClass2 {
  final bool b;
  const MyClass2() : b = false && nil;
}

main() {
  const bool a1 = (i < 0) && (null as String).length < 12;
  Expect.isFalse(a1);

  const bool a2 = false && (null as String).length < 12;
  Expect.isFalse(a2);

  const bool a3 = false && i < 12;
  Expect.isFalse(a3);

  const bool a4 = false && i > 12;
  Expect.isFalse(a4);

  const bool a5 = false && (nil + 1) > 10;
  Expect.isFalse(a5);

  const MyClass1 c1 = MyClass1();
  Expect.isFalse(c1.b);

  const MyClass2 c2 = MyClass2();
  Expect.isFalse(c2.b);
}
