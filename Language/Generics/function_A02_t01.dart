// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A generic function declaration introduces a generic function into
/// the enclosing scope. Consider a function invocation expression of the form
/// [f<T1, . . . , Tl>(...)], where the static type of [f] is a generic function
/// type with formal type parameters [X1 extends B1], . . . , [Xm extends Bm].
/// It is a compile-time error if [m <> l].
/// @description checks that error appears if number of type parameters is
/// @author iarkh@unipro.ru


void testme1<T>() {}
T1? testme2<T1, T2>(T2 t) {}
void testme3<T1, T2, T3>() {}

main() {
  testme1();
  testme1<int>();
  testme1<dynamic>();
  testme1<int, dynamic>();
//^
// [cfe] Expected 1 type arguments.
//       ^^^^^^^^^^^^^^
// [analyzer] COMPILE_TIME_ERROR.WRONG_NUMBER_OF_TYPE_ARGUMENTS_METHOD
  testme1<dynamic, int, int>();
//^
// [cfe] Expected 1 type arguments.
//       ^^^^^^^^^^^^^^^^^^^
// [analyzer] COMPILE_TIME_ERROR.WRONG_NUMBER_OF_TYPE_ARGUMENTS_METHOD

  testme2(1);
  testme2<int>(12);
//^
// [cfe] Expected 2 type arguments.
//       ^^^^^
// [analyzer] COMPILE_TIME_ERROR.WRONG_NUMBER_OF_TYPE_ARGUMENTS_METHOD
  testme2<dynamic>(333);
//^
// [cfe] Expected 2 type arguments.
//       ^^^^^^^^^
// [analyzer] COMPILE_TIME_ERROR.WRONG_NUMBER_OF_TYPE_ARGUMENTS_METHOD
  testme2<int, dynamic>(289);
  testme2<dynamic, int, int>(1);
//^
// [cfe] Expected 2 type arguments.
//       ^^^^^^^^^^^^^^^^^^^
// [analyzer] COMPILE_TIME_ERROR.WRONG_NUMBER_OF_TYPE_ARGUMENTS_METHOD

  testme3();
  testme3<int>();
//^
// [cfe] Expected 3 type arguments.
//       ^^^^^
// [analyzer] COMPILE_TIME_ERROR.WRONG_NUMBER_OF_TYPE_ARGUMENTS_METHOD
  testme3<int, dynamic>();
//^
// [cfe] Expected 3 type arguments.
//       ^^^^^^^^^^^^^^
// [analyzer] COMPILE_TIME_ERROR.WRONG_NUMBER_OF_TYPE_ARGUMENTS_METHOD
  testme3<dynamic, int, int>();
  testme3<dynamic, int, int, String>();
//^
// [cfe] Expected 3 type arguments.
//       ^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] COMPILE_TIME_ERROR.WRONG_NUMBER_OF_TYPE_ARGUMENTS_METHOD
}
