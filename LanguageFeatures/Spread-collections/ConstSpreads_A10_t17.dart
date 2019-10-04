/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion From the Unified collection Spec:
 * A [spreadElement] starting with [...?] is a constant element if its
 * expression is constant and it evaluates to [null] or a constant [List], [Set]
 * or [Map] instance originally created by a list, set or map literal. It is a
 * potentially constant element if the expression is potentially constant
 * expression.
 * @description: Checks that constant map spread [...?] element can only be
 * potentially constant map or null.
 * @author iarkh@unipro.ru
 */

class MyClass {
  final String a;
  const MyClass(Object o) : a = o as String;
}

main() {
  const Map l1 = {...?(MyClass(12345) is MyClass ? {1: 1} : {2: 2})};   //# 01: compile-time error
  const Map m2 = {...?(MyClass(12345) is MyClass ? {11: 124} : null)};  //# 02: compile-time error
  const Map m3 = {...?(MyClass(12345) is MyClass ? {null} : {9: -13})}; //# 03: compile-time error

}
