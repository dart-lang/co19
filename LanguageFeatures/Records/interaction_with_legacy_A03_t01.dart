// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Assuming that v is the language version in which records are
/// released, the following errors apply.
///
/// It is an error for the record type syntax (e.g. (int, int)) to be used
/// syntactically in a library whose language version is less than v.
///
/// @description Check that it is a compile-time error if record type syntax
/// is used in a library whose language version is less than v.
/// @author sgrekhov22@gmail.com

// @dart = 2.18

typedef T1 = ();
//           ^^
// [analyzer] unspecified
// [cfe] unspecified

typedef T2 = (int,);
//           ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

typedef T3 = (int, String);
//           ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

typedef T4 = (int, {String s});
//           ^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

typedef T5 = ({String s});
//           ^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  ()? r1 = null;
//^^
// [analyzer] unspecified
// [cfe] unspecified

  (int,)? r2 = null;
//^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  (int, String)? r3 = null;
//^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  (int, {String s})? r4 = null;
//^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  ({String s})? r5 = null;
//^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
