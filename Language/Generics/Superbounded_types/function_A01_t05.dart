/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Any use of a type [T] which is not well-bounded is a
 * compile-time error.
 * @description Checks that compile error is not thrown when call generic
 * function with two dependant well bounded type parameters
 * @author iarkh@unipro.ru
 */
class A<X extends A<X>> {}
void testme<X extends Y, Y extends A<X>>() {}

main() {
  testme<Null, Null>();
  testme<A<Null>, A<Null>>();
  testme<Null, A<Null>>();
}
