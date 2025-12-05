// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Given a named initializing formal or field parameter (for a
/// primary constructor) with private name `p` in constructor `C`:
/// ...
/// If there is no error then:
/// ...
/// - The instance variable initialized by the parameter (and declared by it, if
///   the parameter is a field parameter), has the private name `p`.
///
/// @description For an instance variable with a private name `p` which is
/// introduced by a declaring parameter, check that it is a compile-time error
/// to use the corresponding public name `n` to access the instance variable.
/// Test primary constructors.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=private-named-parameters,primary-constructors

class C1({var String _p = "_p"});

class C2({required final String _p});

enum E1({final String _p = "_p"}) {
  e0, e1(p: "E1");
}

enum E2({required final String _p}) {
  e0(p: "E2");
}

main() {
  C1().p;
//     ^
// [analyzer] unspecified
// [cfe] unspecified
  C1(p: "one").p;
//             ^
// [analyzer] unspecified
// [cfe] unspecified
  C2(p: "two").p;
//             ^
// [analyzer] unspecified
// [cfe] unspecified

  E1.e0.p;
//      ^
// [analyzer] unspecified
// [cfe] unspecified
  E1.e1.p;
//      ^
// [analyzer] unspecified
// [cfe] unspecified
  E2.e0.p;
//      ^
// [analyzer] unspecified
// [cfe] unspecified
}
