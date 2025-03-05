// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile time error to read a local variable when the
/// variable is potentially unassigned unless the variable is non-final and has
/// nullable type, or is late
///
/// @description Checks that it's a compile time error to read a non-late and
/// non-nullable local variable when the variable is potentially unassigned
/// @author sgrekhov@unipro.ru

main() {
  bool b = (() => true)();
  int x1;
  if (b) {
    x1 = 42;
  }
  x1;
//^^
// [analyzer] unspecified
// [cfe] unspecified

  int x2;
  if (b) {
    x2 = 42;
  }
  x2++;
//^^
// [analyzer] unspecified
// [cfe] unspecified

  int x3;
  if (b) {
    x3 = 42;
  }
  ++x3;
//  ^^
// [analyzer] unspecified
// [cfe] unspecified

  final int x4;
  if (b) {
    x4 = 42;
  }
  x4;
//^^
// [analyzer] unspecified
// [cfe] unspecified
}
