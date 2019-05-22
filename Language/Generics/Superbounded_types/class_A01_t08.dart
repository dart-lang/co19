/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Any use of a type [T] which is not well-bounded is a
 * compile-time error.
 * @description Checks that compile error is not thrown when class with well
 * bounded type parameter is declared
 * @Issue 37028
 * @author iarkh@unipro.ru
 */

class A<T extends A<T>> {}

class B1<X extends A<Object>> {}   //# 01: compile-time error
class B2<X extends A<dynamic>> {}  //# 02: compile-time error
class B3<X extends A<void>> {}     //# 03: compile-time error
class B4<X extends A<Null>> {}

class B5<X extends A<A<Object>>> {}  //# 04: compile-time error
class B6<X extends A<A<dynamic>>> {} //# 05: compile-time error
class B7<X extends A<A<void>>> {}    //# 06: compile-time error
class B8<X extends A<A<Null>>> {}

main() {
}
