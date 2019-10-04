/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion From the Constant-update-2018 Spec:
 * The operator [>>>] is now allowed in a potentially constant expression, and
 * it is valid in constant expression if its left and right operands are [int]
 * instances, and the operation doesn't throw. The [>>>] operator has not been
 * added to the [int] class yet, so unless the left-hand operand's static type
 * is [dynamic], the program will still be rejected. When the operator is added,
 * it should then also work in a constant expression.
 * @description Checks that operator [>>>] is accepted in potentially constant
 * expressions.
 * @Issue 30886
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=triple-shift
import "../../Utils/expect.dart";

main() {
  const int c1 = (-2 >>> 1);
  Expect.equals(-2 >>> 1, c1);

  const int c2 = (125 >>> c1);
  Expect.equals(125 >>> c1, c2);

  const int c3 = (c2 >>> 0);
  Expect.equals(c2 >>> 0, c3);

  const int c4 = (0 >>> 1);
  Expect.equals(0 >>> 1, c4);

  const int c5 = (100000 >>> 100);
  Expect.equals(100000 >>> 100, c5);

}
