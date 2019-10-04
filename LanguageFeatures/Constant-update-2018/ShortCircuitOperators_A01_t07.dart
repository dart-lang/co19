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
 * operand of [&&] operation if the first one is [false] in the potentially
 * constant expression.
 * @author iarkh@unipro.ru
 */

import "../../Utils/expect.dart";

const int checkme = null;

class MyClass {
  final bool b;
  const MyClass(Object o) : b = false && ((o as int) > 25);
}

main() {
  const MyClass c1 = MyClass("testme");
  Expect.isFalse(c1.b);

  const MyClass c2 = MyClass(checkme);
  Expect.isFalse(c2.b);
}
