// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The potentially constant expressions and constant expressions are
/// the following:
/// ...
/// • An expression of the form `e.length` is potentially constant if `e` is a
///   potentially constant expression. It is further constant if `e` is a
///   constant expression that evaluates to an instance of [String], such that
///   `length` denotes an instance getter invocation.
///
/// @description Checks that it is a compile-time error to use a cascade member
/// access in a constant `String.length` expression.
/// @author sgrekhov22@gmail.com

const c1 = "x"..length;
//            ^^
// [analyzer] unspecified
// [cfe] unspecified
const String one = "1";
const c2 = one..length;
//            ^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  print(c1);
  print(c2);
}
