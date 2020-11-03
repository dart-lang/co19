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
 * @author ngl@unipro.ru
 */

abstract class B1<X extends List<int>> {
  X get n;
}
abstract class C1<Y extends List<double>> {
  Y get n;
}

abstract class B2<Y extends List<double>> {
  Y n(Y p);
}
abstract class C2<X extends List<int>> {
  X n(X p);
}

abstract class B3<Y extends List<double>, X extends List<int>> {
  Y n(X p);
}
abstract class C3<Y extends List<double>> {
  Y n(Y p1, Y p2);
}

// The same name getters with different return types
mixin M1 on B1<List<int>>, C1<List<double>> {}
//    ^^
// [analyzer] COMPILE_TIME_ERROR.INCONSISTENT_INHERITANCE
// [cfe] Class 'B1 with C1' inherits multiple members named 'n' with incompatible signatures.

// The same name getter and method with the same return types
mixin M2 on B1<List<int>>, C2<List<int>> {}
//    ^^
// [analyzer] COMPILE_TIME_ERROR.INCONSISTENT_INHERITANCE_GETTER_AND_METHOD
// [cfe] Can't inherit members that conflict with each other.

// The same name methods with different return types
mixin M3 on B2<List<double>>, C2<List<int>> {}
//    ^^
// [analyzer] COMPILE_TIME_ERROR.INCONSISTENT_INHERITANCE
// [cfe] Class 'B2 with C2' inherits multiple members named 'n' with incompatible signatures.

// The methods with the same return types and different parameters number
mixin M4 on B3<List<double>, List<int>>, C3<List<double>> {}
//    ^^
// [analyzer] COMPILE_TIME_ERROR.INCONSISTENT_INHERITANCE
// [cfe] Class 'B3 with C3' inherits multiple members named 'n' with incompatible signatures.

main() {
}
