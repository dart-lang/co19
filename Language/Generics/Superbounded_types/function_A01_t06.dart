/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Any use of a type [T] which is not well-bounded is a
 * compile-time error.
 * @description Checks that compile error is thrown when call generic
 * function with two dependant type parameters which are not bounded well.
 * @Issue 37061
 * @author iarkh@unipro.ru
 */
class A<X extends A<X>> {}
void testme<X extends Y, Y extends A<X>>() {}

main() {
  testme();                   //# 01: compile-time error

  testme<Null, dynamic>();    //# 02: compile-time error
  testme<dynamic, Null>();    //# 03: compile-time error
  testme<dynamic, dynamic>(); //# 04: compile-time error

  testme<Null, Object>();     //# 05: compile-time error
  testme<Object, Null>();     //# 06: compile-time error
  testme<Object, Object>();   //# 07: compile-time error

  testme<Null, void>();       //# 08: compile-time error
  testme<void, Null>();       //# 09: compile-time error
  testme<void, void>();       //# 10: compile-time error

  testme<A<Null>, Null>();    //# 11: compile-time error
}
