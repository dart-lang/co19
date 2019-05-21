/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Any use of a type [T] which is not well-bounded is a
 * compile-time error.
 * @description Checks that compile error is thrown when class with not well
 * bounded type parameter is declared
 * @author iarkh@unipro.ru
 */

class A<T extends A<T>> {}

class B1<X extends A> {}       //# 01: compile-time error
class B2<X extends A<A>> {}    //# 02: compile-time error
class B3<X extends A<int>> {}  //# 03: compile-time error

main() {
}
