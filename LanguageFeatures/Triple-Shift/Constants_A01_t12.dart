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
 * @description Checks that arguments of [>>>] operator should be non-negative
 * (see co19 Issue #355 for more details).
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=triple-shift

const d1 = 2;
const d2 = 14;
const d3 = 0;

const d4 = -1000;
const d5 = -9;

class MyClass {
  final int a;
  const MyClass(i1, i2) : a = (i1 >>> i2);
}

main() {
  const MyClass c1 = MyClass(d1, d4);        //# 01: compile-time error
  const MyClass c2 = MyClass(d2, d5);        //# 02: compile-time error
  const MyClass c3 = MyClass(11, -133);      //# 03: compile-time error
  const MyClass c4 = MyClass(-2525, -19999); //# 04: compile-time error
  const MyClass c5 = MyClass(0, -4);         //# 05: compile-time error
}
