/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Further, the interfaces B and C must be compatible. The on clause
 * introduces a synthetic interface combining B and C, call it A$super, which is
 * equivalent to the interface of a class declaration of the form:
 *   abstract class A$super<X extends S, Y extends T> implements B, C {}
 * It is a compile-time error for the mixin declaration if the class declaration
 * above would not be valid.
 *
 * @description Checks that it is a compile-time error for the mixin declaration
 * if the interfaces B and C are not compatible.
 * @compile-error
 * @author ngl@unipro.ru
 */

class T1 {}
class T2 {}

abstract class B1 {
  T1 get n;
}
abstract class C1 {
  T2 get n;
}

abstract class B2 {
  T2 n(T2 p);
}
abstract class C2 {
  T1 n(T1 p);
}

abstract class B3 {
  T2 n(T1 p);
}
abstract class C3 {
  T2 n(T2 p1, T1 p2);
}

// The same name getters with different return types
mixin M1 on B1, C1 {}  //# 01: compile-time error

// The same name getter and method with the same return types
mixin M2 on B1, C2 {} //# 02: compile-time error

// The same name methods with different return types
mixin M3 on B2, C2 {} //# 03: compile-time error

// The methods with the same return types and different parameters number
mixin M4 on B3, C3 {} //# 04: compile-time error

main() {
}
