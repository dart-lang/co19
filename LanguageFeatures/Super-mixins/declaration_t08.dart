/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A mixin declaration defines an interface. The interface for this
 * mixin declaration is equivalent to the interface of the class declared as:
 *  abstract class A<X extends S, Y extends T> extends A$super<X, Y>
 *    implements D, E { body' }
 * where body' contains abstract declarations corresponding to the instance
 * members of body of the mixin A.
 * It is a compile time error for the mixin declaration if this class
 * declarations would not be valid.
 *
 * @description Checks that it is a compile-time error for the mixin declaration
 * if classes from on clause and implements clause are not compatible.
 * @compile-error
 * @author ngl@unipro.ru
 */

abstract class I1<X extends List<int>> {
  X get n;
}
abstract class I2<Y extends List<double>> {
  Y n(Y p);
}
abstract class I3<Y extends List<double>, X extends List<int>> {
  Y n(X p);
}
class J {}

class B {}
abstract class C1<Y extends List<double>> {
  Y get n;
}
abstract class C2<X extends List<int>> {
  X n(X p);
}
abstract class C3<Y extends List<double>> {
  Y n(Y p1, Y p2);
}

// The same name getters with different return types
mixin M1 on B, C1 implements I1, J {}  //# 01: compile-time error

// The same name getter and method with the same return types
mixin M2 on B, C2 implements I1, J {} //# 02: compile-time error

// The same name methods with different return types
mixin M3 on B, C2 implements I2, J {} //# 03: compile-time error

// The methods with the same return types and different parameters number
mixin M4 on B, C3 implements I3, J {} //# 04: compile-time error

main() {
}
