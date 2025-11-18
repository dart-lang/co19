// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Given a named initializing formal or field parameter (for a
/// primary constructor) with private name `p` in constructor `C`:
/// - If `p` has no corresponding public name `n`, then compile-time error.
///
/// @description Check that it is a compile-time error if a named formal
/// parameter of a declaring constructor has a private name with no
/// corresponding public name.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=private-named-parameters,primary-constructors

class C1({var String __p}) {
//                   ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class C2({required final String _1}) {
//                              ^^
// [analyzer] unspecified
// [cfe] unspecified
}

class C3 {
  this({required final String __p});
//                            ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class C4 {
  this({var String _1 = ""});
//                 ^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET1 {
  this({final String __p = ""});
//                   ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET2 {
  this({final String _1 = ""});
//                   ^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E1({required final String __p}) {
//                             ^^^
// [analyzer] unspecified
// [cfe] unspecified
  e0(_p: "");
//   ^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E2 {
  e0;

  const this({final String _1 = ""});
//                         ^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C1);
  print(C2);
  print(C3);
  print(C4);
  print(ET1);
  print(ET2);
  print(E1);
  print(E2);
}
