// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile time error to read a local variable when the
/// variable is potentially unassigned unless the variable is non-final and has
/// nullable type, or is late
///
/// @description Checks that it's a compile time error to read a non-late and
/// final nullable local variable when the variable is potentially unassigned
///
/// @author sgrekhov@unipro.ru


main() {
  bool b = (() => true)();
  final int? x1;
  if (b) {
    x1 = 42;
  }
  x1;
//^^
// [analyzer] unspecified
// [cfe] unspecified

  final x2;
  if (b) {
    x2 = 42;
  }
  x2;
//^^
// [analyzer] unspecified
// [cfe] unspecified
}
