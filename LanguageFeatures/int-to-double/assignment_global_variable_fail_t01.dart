// Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The static type of a double valued integer literal is [double]
/// @description Checks that it is a compile error if integer but not a literal
/// is assigned to double global variable
/// @author sgrekhov@unipro.ru

int foo() => 42;

double d1 = foo();
//          ^^^^^
// [analyzer] COMPILE_TIME_ERROR.INVALID_ASSIGNMENT
// [cfe] A value of type 'int' can't be assigned to a variable of type 'double'.
double? d2 = null;

main() {
  d2 ??= foo();
//       ^^^^^
// [analyzer] COMPILE_TIME_ERROR.INVALID_ASSIGNMENT
// [cfe] A value of type 'int' can't be assigned to a variable of type 'double?'.
}
