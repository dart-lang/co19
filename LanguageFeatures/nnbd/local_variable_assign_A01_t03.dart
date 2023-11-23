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
  final x1;
  var f1 = () {
    x1 = 42;
//  ^^
// [analyzer] unspecified
// [cfe] unspecified
  };
  x1 = 0;
//^^
// [analyzer] unspecified
// [cfe] unspecified

  final int x2;
  var f2 = () {
    x2 = 42;
//  ^^
// [analyzer] unspecified
// [cfe] unspecified
  };
  x2 = 0;
//^^
// [analyzer] unspecified
// [cfe] unspecified

  final int? x3;
  var f3 = () {
    x3 = 42;
//  ^^
// [analyzer] unspecified
// [cfe] unspecified
  };
  x3 = 0;
//^^
// [analyzer] unspecified
// [cfe] unspecified
}
