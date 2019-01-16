/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion An expression of the form [e is T] or [e is! T] is accepted as a
 * potentially and compile-time constant expression if [e] is potentially
 * constant or compile-time constant, respectively, and [T] is a compile-time
 * constant type.
 * @description Checks that an expression of the form [e is! T] is not accepted
 * and causes compile time error if [T] is not a compile-time constant type.
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=constant-update-2018
class MyClass<E> {
  final int res;
  const MyClass(Object o) : res = o is! E ? 0 : 1;   //# 01: compile-time error
}

class A<E> {
  static const bool res = String is! E; //# 02: compile-time error
}

main() {
}
