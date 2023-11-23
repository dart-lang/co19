// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion N/A
/// @description Checks that triple right shift argument cannot be negative and
/// cause compile time error if this is a constant expression (see co19 Issue
/// #355 for more details)
/// @author iarkh@unipro.ru


main() {
  const int i1 = 12345;
  const int i2 = -11;
  const int i3 = -12345;

  const res1 = i1 >>> i2;
//             ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  const res2 = i1 >>> i3;
//             ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  const res3 = i2 >>> i3;
//             ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  const res4 = i3 >>> i2;
//             ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  const res5 = i1 >>> -2;
//             ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  const res6 = 2000 >>> i3;
//             ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  const res7 = 2000 >>> -14;
//             ^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
