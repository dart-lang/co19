// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Let M be a mixin declaration of the form
/// mixin N<X1 extends B1, . . . , Xs extends Bs> on T1, . . . , Tn
///   implements I1, . . . , Ik {
/// members
/// }
/// ...
/// Let MS be the interface declared by the class declaration
/// abstract class Msuper<P1, ..., Pm> implements T1, . . . , Tn {}
/// where Msuper is a fresh name. It is a compile-time error for the mixin
/// declaration if the MS class declaration would cause a compile-time error,
/// that is, if any member is declared by more than one declared superinterface,
/// and there is not a most specific signature for that member among the super
/// interfaces
///
/// @description Checks that it is a compile-time error for a mixin declaration
/// if `MS` class declaration would cause a compile-time error
/// @author sgrekhov@unipro.ru
/// @issue 45505

class C1 {
  void m(Object o, String s) {}
}

class C2 {
  void m(String o, Object s) {}
}

mixin CM on C1, C2 {}
//    ^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  print(CM);
}
