// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile time error to assign a value to a final, non-late
/// local variable which is potentially assigned. Thus, it is not a compile time
/// error to assign to a definitely unassigned final local variable.
///
/// @description Checks that it's a compile error to assign a value to a final,
/// non-late local variable which is potentially assigned
///
/// @author sgrekhov@unipro.ru


main() {
  bool b = (() => true)();
  final x1;
  if (b) {
    x1 = 42;
  }
  x1 = 0;
//^^
// [analyzer] unspecified
// [cfe] unspecified

  b = (() => false)();
  final x2;
  if (b) {
    x2 = 42;
  }
  x2 = 0;
//^^
// [analyzer] unspecified
// [cfe] unspecified

  b = (() => true)();
  final int x3;
  if (b) {
    x3 = 42;
  }
  x3 = 0;
//^^
// [analyzer] unspecified
// [cfe] unspecified

  b = (() => false)();
  final int x4;
  if (b) {
    x4 = 42;
  }
  x4 = 0;
//^^
// [analyzer] unspecified
// [cfe] unspecified

  b = (() => true)();
  final int? x5;
  if (b) {
    x5 = 42;
  }
  x5 = 0;
//^^
// [analyzer] unspecified
// [cfe] unspecified

  b = (() => false)();
  final int? x6;
  if (b) {
    x6 = 42;
  }
  x6 = 0;
//^^
// [analyzer] unspecified
// [cfe] unspecified
}
