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

main() {
  const c1 = -2 >>> 1.79;
// [error line 22, column 0]
// [analyzer] unspecified
// [cfe] unspecified
  const c2 = 188.0 >>> 2;
// [error line 26, column 0]
// [analyzer] unspecified
// [cfe] unspecified
  const c3 = "abcd" >>> 11;
// [error line 30, column 0]
// [analyzer] unspecified
// [cfe] unspecified
  const c4 = 1 >>> "abcd";
// [error line 34, column 0]
// [analyzer] unspecified
// [cfe] unspecified
  const c5 = 1880000000000000000000000000000000000000000 >>> 2;
// [error line 38, column 0]
// [analyzer] unspecified
// [cfe] unspecified
  const c6 = 24 >>> 1000000000000000000000000000000000;
// [error line 42, column 0]
// [analyzer] unspecified
// [cfe] unspecified
}
