/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Any use of a type [T] which is not well-bounded is a
 * compile-time error.
 * @description Checks that compile error is thrown when call generic
 * function with type parameter which is not well bounded
 * @author iarkh@unipro.ru
 */
class A<T> {}
void testme<X extends num>() {}

main() {
  testme<String>();  //# 01: compile-time error
  testme<dynamic>(); //# 02: compile-time error
  testme<void>();    //# 03: compile-time error
  testme<Object>();  //# 04: compile-time error
}
