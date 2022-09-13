// Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The static type of a double valued integer literal is [double]
/// @description Checks that it is a compile error if integer but not a literal
/// is assigned to double local variable
/// @author sgrekhov@unipro.ru

int init() => 42;

class C {

  static void staticMethod() {
    double s1 = init();
//              ^^^^^^
// [analyzer] COMPILE_TIME_ERROR.INVALID_ASSIGNMENT
// [cfe] A value of type 'int' can't be assigned to a variable of type 'double'.
    double? s2 = null;
    s2 ??= init();
//         ^^^^^^
// [analyzer] COMPILE_TIME_ERROR.INVALID_ASSIGNMENT
// [cfe] A value of type 'int' can't be assigned to a variable of type 'double?'.
  }

  void instanceMethod() {
    double m1 = init();
//              ^^^^^^
// [analyzer] COMPILE_TIME_ERROR.INVALID_ASSIGNMENT
// [cfe] A value of type 'int' can't be assigned to a variable of type 'double'.
    double? m2 = null;
    m2 ??= init();
//         ^^^^^^
// [analyzer] COMPILE_TIME_ERROR.INVALID_ASSIGNMENT
// [cfe] A value of type 'int' can't be assigned to a variable of type 'double?'.
  }
}

void foo() {
  double l1 = init();
//            ^^^^^^
// [analyzer] COMPILE_TIME_ERROR.INVALID_ASSIGNMENT
// [cfe] A value of type 'int' can't be assigned to a variable of type 'double'.
  double? l2 = null;
  l2 ??= init();
//       ^^^^^^
// [analyzer] COMPILE_TIME_ERROR.INVALID_ASSIGNMENT
// [cfe] A value of type 'int' can't be assigned to a variable of type 'double?'.
}

main() {
  double d1 = init();
//            ^^^^^^
// [analyzer] COMPILE_TIME_ERROR.INVALID_ASSIGNMENT
// [cfe] A value of type 'int' can't be assigned to a variable of type 'double'.
  double? d2 = null;
  d2 ??= init();
//       ^^^^^^
// [analyzer] COMPILE_TIME_ERROR.INVALID_ASSIGNMENT
// [cfe] A value of type 'int' can't be assigned to a variable of type 'double?'.


  void bar() {
    double b1 = init();
//              ^^^^^^
// [analyzer] COMPILE_TIME_ERROR.INVALID_ASSIGNMENT
// [cfe] A value of type 'int' can't be assigned to a variable of type 'double'.
    double? b2 = null;
    b2 ??= init();
//         ^^^^^^
// [analyzer] COMPILE_TIME_ERROR.INVALID_ASSIGNMENT
// [cfe] A value of type 'int' can't be assigned to a variable of type 'double?'.
  }

  foo();
  bar();
  C.staticMethod();
  new C().instanceMethod();
}
