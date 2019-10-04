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
 * @description Checks that arguments of [>>>] operator should be int.
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=triple-shift

class MyClass {
  final int a;
  const MyClass(i1, i2) : a = (i1 >>> i2);
}

main() {
  const MyClass c1 = MyClass(1.0, 1);       //# 01: compile-time error
  const MyClass c2 = MyClass(125.12, 2);    //# 02: compile-time error
  const MyClass c3 = MyClass("abcd", 2);    //# 03: compile-time error
  const MyClass c4 = MyClass(12, "testme"); //# 04: compile-time error
}
