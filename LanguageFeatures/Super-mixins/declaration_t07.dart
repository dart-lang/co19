// Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A mixin declaration defines an interface. The interface for this
/// mixin declaration is equivalent to the interface of the class declared as:
///  abstract class A<X extends S, Y extends T> extends A$super<X, Y>
///    implements D, E { body' }
/// where body' contains abstract declarations corresponding to the instance
/// members of body of the mixin A.
/// It is a compile time error for the mixin declaration if this class
/// declarations would not be valid.
///
/// @description Checks that it is a compile-time error for the mixin declaration
/// if classes from implements clause are not compatible.
/// @author ngl@unipro.ru


abstract class I1<X extends List<int>> {
  X get n;
}
abstract class J1<Y extends List<double>> {
  Y get n;
}

abstract class I2<Y extends List<double>> {
  Y n(Y p);
}
abstract class J2<X extends List<int>> {
  X n(X p);
}

abstract class I3<Y extends List<double>, X extends List<int>> {
  Y n(X p);
}
abstract class J3<Y extends List<double>> {
  Y n(Y p1, Y p2);
}

class B {}
class C {}

// The same name getters with different return types
mixin M1 on B, C implements I1, J1 {}
//    ^^
// [analyzer] COMPILE_TIME_ERROR.INCONSISTENT_INHERITANCE
// [cfe] Class 'M1' inherits multiple members named 'n' with incompatible signatures.

// The same name getter and method with the same return types
mixin M2 on B, C implements I1, J2 {}
//    ^^
// [analyzer] COMPILE_TIME_ERROR.INCONSISTENT_INHERITANCE_GETTER_AND_METHOD
// [cfe] Can't inherit members that conflict with each other.

// The same name methods with different return types
mixin M3 on B, C implements I2, J2 {}
//    ^^
// [analyzer] COMPILE_TIME_ERROR.INCONSISTENT_INHERITANCE
// [cfe] Class 'M3' inherits multiple members named 'n' with incompatible signatures.

// The methods with the same return types and different parameters number
mixin M4 on B, C implements I3, J3 {}
//    ^^
// [analyzer] COMPILE_TIME_ERROR.INCONSISTENT_INHERITANCE
// [cfe] Class 'M4' inherits multiple members named 'n' with incompatible signatures.

main() {
}
