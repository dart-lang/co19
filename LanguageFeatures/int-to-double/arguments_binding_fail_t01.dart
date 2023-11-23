// Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The static type of a double valued integer literal is [double]
/// @description Checks that the static type of a double valued integer literal
/// is [double]. Test arguments binding and generic routine
/// @author sgrekhov@unipro.ru


class C<X extends num, Y extends double> {
  void methodX(X val) {}
  void methodY(Y val) {}

  test() {
    methodX(42);
//          ^^
// [analyzer] COMPILE_TIME_ERROR.ARGUMENT_TYPE_NOT_ASSIGNABLE
// [cfe] The argument type 'int' can't be assigned to the parameter type 'X'.
    methodX(0x42);
//          ^^^^
// [analyzer] COMPILE_TIME_ERROR.ARGUMENT_TYPE_NOT_ASSIGNABLE
// [cfe] The argument type 'int' can't be assigned to the parameter type 'X'.
    methodY(42);
//          ^^
// [analyzer] COMPILE_TIME_ERROR.ARGUMENT_TYPE_NOT_ASSIGNABLE
// [cfe] The argument type 'int' can't be assigned to the parameter type 'Y'.
    methodY(0x42);
//          ^^^^
// [analyzer] COMPILE_TIME_ERROR.ARGUMENT_TYPE_NOT_ASSIGNABLE
// [cfe] The argument type 'int' can't be assigned to the parameter type 'Y'.
  }
}

void foo<X extends num, Y extends double>() {
  bar1<X>(42);
//        ^^
// [analyzer] COMPILE_TIME_ERROR.ARGUMENT_TYPE_NOT_ASSIGNABLE
// [cfe] The argument type 'int' can't be assigned to the parameter type 'X'.
  bar1<X>(0x42);
//        ^^^^
// [analyzer] COMPILE_TIME_ERROR.ARGUMENT_TYPE_NOT_ASSIGNABLE
// [cfe] The argument type 'int' can't be assigned to the parameter type 'X'.
  bar1<Y>(42);
//        ^^
// [analyzer] COMPILE_TIME_ERROR.ARGUMENT_TYPE_NOT_ASSIGNABLE
// [cfe] The argument type 'int' can't be assigned to the parameter type 'Y'.
  bar1<Y>(0x42);
//        ^^^^
// [analyzer] COMPILE_TIME_ERROR.ARGUMENT_TYPE_NOT_ASSIGNABLE
// [cfe] The argument type 'int' can't be assigned to the parameter type 'Y'.

  bar2<X>(42);
//     ^
// [analyzer] unspecified
// [cfe] unspecified
  bar2<X>(0x42);
//     ^
// [analyzer] unspecified
// [cfe] unspecified
  bar2<Y>(42);
//        ^^
// [analyzer] COMPILE_TIME_ERROR.ARGUMENT_TYPE_NOT_ASSIGNABLE
// [cfe] The argument type 'int' can't be assigned to the parameter type 'Y'.
  bar2<Y>(0x42);
//        ^^^^
// [analyzer] COMPILE_TIME_ERROR.ARGUMENT_TYPE_NOT_ASSIGNABLE
// [cfe] The argument type 'int' can't be assigned to the parameter type 'Y'.
}

void bar1<X extends num>(X x) {}
void bar2<Y extends double>(Y y) {}


main() {
  C<double, double> c = C<double, double>();
  c.test();

  foo<double, double>();
}
