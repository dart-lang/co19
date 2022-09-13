// Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The static type of a double valued integer literal is [double]
/// @description Checks that it is a compile error if integer but not a literal
/// is assigned to class member via this expression
/// @author sgrekhov@unipro.ru

int foo() => 42;

class C {
  double? m1;

  void set instanceSetter(double val) {
    m1 = val;
  }

  test() {
    this.m1 = foo();
//            ^^^^^
// [analyzer] COMPILE_TIME_ERROR.INVALID_ASSIGNMENT
// [cfe] A value of type 'int' can't be assigned to a variable of type 'double?'.
    this?.m1 = foo();
//             ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    this.m1 ??= foo();
//              ^^^^^
// [analyzer] COMPILE_TIME_ERROR.INVALID_ASSIGNMENT
// [cfe] A value of type 'int' can't be assigned to a variable of type 'double?'.
    this?.m1 ??= foo();
//               ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

    this.instanceSetter = foo();
//                        ^^^^^
// [analyzer] COMPILE_TIME_ERROR.INVALID_ASSIGNMENT
// [cfe] A value of type 'int' can't be assigned to a variable of type 'double'.
    this?.instanceSetter = foo();
//                         ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

main() {
  C c = C();
  c.test();
}
