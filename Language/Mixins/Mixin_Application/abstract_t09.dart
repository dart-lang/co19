// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.9

/// @assertion The effect of a class definition of the form class C = M; or the
/// form class C<T1,...,Tn> = M; in library L is to introduce the name C into
/// the scope of L, bound to the class defined by the mixin application M.
/// The name of the class is also set to C. Iff the class is prefixed by the
/// built-in identifier abstract, the class being defined is an abstract class.
/// @description Checks that trying to declare a class which is a mixin with
/// type alias causes a compile time error in dart 2.9.
/// @Issue 47495
/// @author iarkh@unipro.ru

class S {
}

class M {
}

typedef SAlias = S;
//             ^
// [analyzer] unspecified
// [cfe] unspecified

typedef MAlias = M;
//             ^
// [analyzer] unspecified
// [cfe] unspecified

class C = SAlias with MAlias;
//        ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  new C();
}
