// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile time error to assign a value to a final, late
/// local variable if it is definitely assigned. Thus, it is not a compile time
/// error to assign to a potentially unassigned final, late local variable.
///
/// @description Checks that it's a compile error to assign a value to a final,
/// late local variable which is definitely assigned
/// @author sgrekhov@unipro.ru

main() {
  late final x1 = 42;
  x1 = 0;
//^^
// [analyzer] unspecified
// [cfe] unspecified

  late final x2;
  x2 = 42;
  x2 = 0;
//^^
// [analyzer] unspecified
// [cfe] unspecified

  late final int x3 = 42;
  x3 = 0;
//^^
// [analyzer] unspecified
// [cfe] unspecified

  late final int x4;
  x4 = 42;
  x4 = 0;
//^^
// [analyzer] unspecified
// [cfe] unspecified

  late final int? x5 = 42 as int?;
  x5 = 0;
//^^
// [analyzer] unspecified
// [cfe] unspecified

  late final int? x6;
  x6 = 42;
  x6 = 0;
//^^
// [analyzer] unspecified
// [cfe] unspecified
}
