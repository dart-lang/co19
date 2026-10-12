// Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Let `MS` be the interface declared by the class declaration
/// ```
/// abstract class Msuper<P1, ..., Pm> implements T1, ..., Tn {}
/// ```
/// where `Msuper` is a fresh name. It is a compile-time error for the mixin
/// declaration if the `MS` class declaration would cause a compile-time error,
/// that is, if any member is declared by more than one declared superinterface,
/// and there is not a most specific signature for that member among the super
/// interfaces.
///
/// @description Check that it is a compile-time error for a mixin declaration
/// to implement incompatible interfaces.
/// @author ngl@unipro.ru

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
// [analyzer] unspecified
// [cfe] unspecified

// The same name getter and method with the same return types
mixin M2 on B1<List<int>>, C2<List<int>> {}
//    ^^
// [analyzer] unspecified
// [cfe] unspecified

// The same name methods with different return types
mixin M3 on B2<List<double>>, C2<List<int>> {}
//    ^^
// [analyzer] unspecified
// [cfe] unspecified

// The methods with the same return types and different parameters number
mixin M4 on B3<List<double>, List<int>>, C3<List<double>> {}
//    ^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  print(M1);
  print(M2);
  print(M3);
  print(M4);
}
