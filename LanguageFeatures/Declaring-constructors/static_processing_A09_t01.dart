// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The following errors apply to formal parameters of a declaring
/// constructor, be it in the header or in the body. Let `p` be a formal
/// parameter of a declaring constructor in a class, enum, or extension type
/// declaration `D` named `C`:
/// ...
/// A compile-time error occurs if p has the modifier covariant, but not `var`.
///
/// @description Check that it is a compile-time error if a formal parameters of
/// a declaring constructor has the modifier `covariant`, but not `var`. Test
/// classes.
/// @author sgrekhov22@gmail.com

// TODO (sgrekhov) Add `declaring-constructors` experimental flag

class C1(covariant String x) {}
//       ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

class C2([covariant String x = ""]) {}
//        ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

class C3({covariant String x = ""}) {}
//        ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

class C4({required covariant String x}) {}
//                 ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

class C5 {
  this(covariant String x);
//     ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class C6 {
  this([covariant String x = ""]);
//      ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class C7 {
  this({covariant String x = ""});
//      ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class C8 {
  this({required covariant String x});
//               ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C1);
  print(C2);
  print(C3);
  print(C4);
  print(C5);
  print(C6);
  print(C7);
  print(C8);
}
