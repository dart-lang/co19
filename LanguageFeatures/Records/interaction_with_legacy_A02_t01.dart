// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Assuming that v is the language version in which records are
/// released, the following errors apply.
///
/// It is an error for the record literal syntax (e.g. (3, 4)) to be used
/// syntactically in a library whose language version is less than v.
///
/// @description Check that it is a compile-time error if record literal syntax
/// is used in a library whose language version is less than v.
/// @author sgrekhov22@gmail.com

// @dart = 2.18

// SharedOptions=--enable-experiment=records

void foo(dynamic x) {}

main() {
  var r1 = (1, 2);
//         ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  var r2 = (1, n: 2);
//         ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  var r3 = (1,);
//         ^^^^
// [analyzer] unspecified
// [cfe] unspecified

  var r4 = ();
//         ^^
// [analyzer] unspecified
// [cfe] unspecified

  var r5 = (s: "x");
//         ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  foo(());
//    ^^
// [analyzer] unspecified
// [cfe] unspecified

  foo((1,));
//    ^^^^
// [analyzer] unspecified
// [cfe] unspecified

  foo((1, 2));
//    ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  foo((1, n: 42));
//    ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
