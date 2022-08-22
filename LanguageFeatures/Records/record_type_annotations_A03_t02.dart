// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if a record type has any of:
///
/// The same field name more than once.
///
/// No named fields and only one positional field. This isn't ambiguous, since
/// there are no parenthesized type expressions in Dart. But there is no reason
/// to allow single positional element record types when the corresponding
/// record values are prohibited.
///
/// A field named hashCode, runtimeType, noSuchMethod, or toString.
///
/// A field name that starts with an underscore.
///
/// @description Checks that it is a compile-time error if a record type has the
/// same field name more than once. Test positional fields
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=records

typedef R1 = (int i, {String s, int i});
//                                  ^
// [analyzer] unspecified
// [cfe] unspecified

typedef R2 = (int i, int i, {String s});
//                       ^
// [analyzer] unspecified
// [cfe] unspecified

typedef (int i, {String s, int i}) R3();
//                             ^
// [analyzer] unspecified
// [cfe] unspecified

typedef (int i, int i, {String s}) R4();
//                  ^
// [analyzer] unspecified
// [cfe] unspecified

typedef void R5((int i, {String s, int i}));
//                                     ^
// [analyzer] unspecified
// [cfe] unspecified

typedef void R6((int i, int i, {String s}));
//                          ^
// [analyzer] unspecified
// [cfe] unspecified

(int i, String s, {String s}) foo1() => (42, "", s: "");
//                        ^
// [analyzer] unspecified
// [cfe] unspecified

(int i, String i, {String s}) foo2() => (42, "", s: "");
//             ^
// [analyzer] unspecified
// [cfe] unspecified

void bar1((int i, {String s, String i})) {}
//                                  ^
// [analyzer] unspecified
// [cfe] unspecified

void bar2((int i, String i, {String s})) {}
//                                  ^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  (int i, {String s, int i}) r1 = (42, s: "", i: 0);
//                       ^
// [analyzer] unspecified
// [cfe] unspecified

  (bool d, double d, {int i, String s}) r2 = (true, 1.1, i: 42, s: "");
//                ^
// [analyzer] unspecified
// [cfe] unspecified

  dynamic d = ({i: 1, s: "Lily was here"});
  if (d is (int i, {int i, String s})) {
//              ^
// [analyzer] unspecified
// [cfe] unspecified
  }

  if (d is (int i, int i, {String s})) {
//                     ^
// [analyzer] unspecified
// [cfe] unspecified
  }
  d as (int i, {String s, int i});
//                            ^
// [analyzer] unspecified
// [cfe] unspecified

  d as (int i, int i, {String s});
//                 ^
// [analyzer] unspecified
// [cfe] unspecified
}
