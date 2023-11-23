// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Let D be a mixin application class declaration of the form
/// abstract? class N = S with M1, ..., Mn implements I1, ..., Ik;
/// ...
/// The effect of D in library L is to introduce the name N into the scope of
/// L, bound to the class defined by the clause S with M1, ..., Mn with name N,
/// as described below. If k > 0 then the class also implements I1, . . . , Ik.
/// Iff the class declaration is prefixed by the built-in identifier abstract,
/// the class being defined is made an abstract class
///
/// @description Checks that it is a compile-time error, if class `C` is
/// declared without an 'abstract' identifier and does not implement all
/// abstract methods. Test type aliases
/// @author sgrekhov@unipro.ru

abstract mixin class M {
  int n();
}

abstract class S {
  int m();
}

typedef SAlias = S;
typedef MAlias = M;

class C = SAlias with MAlias;
//    ^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  new C();
}
