// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Assuming that v is the language version in which records are
/// released, the following errors apply.
///
/// It is an error for the identifier [Record], denoting the [Record] class from
/// dart:core, where that import scope name is only imported from platform
/// libraries, to appear in a library whose language version is less than v.
///
/// @description Check that it is a compile-time error if class [Record] from
/// dart:core is used in a library whose language version is less than v.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=records

// @dart = 2.18

typedef T1 = Record;
//           ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

T? foo<T>(T? t) => t;

main() {
  Record? r = null;
//^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  foo<Record>(null);
//    ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
