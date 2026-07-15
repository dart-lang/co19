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
/// if classes in its implements clause contain getters with the same names but
/// different return types.
/// @author ngl@unipro.ru

class I {
  int get i1 => 1;
}

class B {
  double get i1 => 2.0;
}

mixin M on B implements I {}
//    ^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  print(M);
}
