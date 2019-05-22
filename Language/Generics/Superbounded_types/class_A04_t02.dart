/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile-time error if a parameterized type [T] is
 * super-bounded when it is used in any of the following ways:
 * ...
 * [T] is an immediate subterm of an [extends] clause of a class (10.8), or it
 * occurs as an element in the type list of an [implements] clause (10.9), or a
 * [with] clause (10).
 * @description Checks that exception is thrown if super-bounded class occurs in
 * as an element in the type list of an [implements] clause
 * @author iarkh@unipro.ru
 */

class A<T extends A<T>> {}

class B1 implements A {}             //# 01: compile-time error
class B2<X extends A<X>> implements A<X> {}

class B3 implements A<dynamic> {}    //# 02: compile-time error
class B4 implements A<Object> {}     //# 03: compile-time error
class B5 implements A<void> {}       //# 04: compile-time error
class B6 implements A<Null> {}

class B7 implements A<A<dynamic>> {} //# 05: compile-time error
class B8 implements A<A<Object>> {}  //# 06: compile-time error
class B9 implements A<A<void>> {}    //# 07: compile-time error
class B10 implements A<A<Null>> {}

main() {}
