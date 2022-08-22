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
/// @description Checks that it is a compile-time error if a record type has no
/// named fields and only one positional field
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=records

typedef R1 = (int i);
//           ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

typedef (int) R2();
//      ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

typedef void R3((String s));
//              ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  (int) foo() => (42);
//^^^^^
// [analyzer] unspecified
// [cfe] unspecified

void bar((int i)) {}
//       ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  (int) r1 = (42);
//^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  (double d) r2 = (3.14);
//^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  ((int)) r3 = ((42));
//^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  dynamic d = (1, 3.14);
  if (d is (int i)) {
//         ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }

  d as (int);
//     ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
