// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A generic class declaration introduces a generic class into the 
/// enclosing library scope. A generic class is a mapping that accepts a list of
/// actual type arguments and maps them to a class. Consider a generic class
/// declaration [G] named [C] with formal type parameter declarations [X1 extends
/// B1,..., Xm extends Bm], and a parameterized type [T] of the form
/// [C<T1,..., Tl>].
/// It is a compile-time error if [m != l].
/// @description Checks that compile error is thrown for the case with several
/// type arguments
/// @author iarkh@unipro.ru


class C1<T1 extends num?, T2 extends T1> {}
class C2<T1 extends int?, T2 extends Function?, T3 extends num?, T4 extends List?> {}
class C3<T1, T2, T3> {}

main() {
  C1? c1;
  C1<num, num>? c2;
  C1<int?, Null>? c3;
  C1<num, int>? c4;

  C1<dynamic>? c5;
//^^^^^^^^^^^^
// [analyzer] COMPILE_TIME_ERROR.WRONG_NUMBER_OF_TYPE_ARGUMENTS
// [cfe] Expected 2 type arguments.
  C1<Null>?    c6;
//^^^^^^^^^
// [analyzer] COMPILE_TIME_ERROR.WRONG_NUMBER_OF_TYPE_ARGUMENTS
// [cfe] Expected 2 type arguments.
  C1<int>?     c7;
//^^^^^^^^
// [analyzer] COMPILE_TIME_ERROR.WRONG_NUMBER_OF_TYPE_ARGUMENTS
// [cfe] Expected 2 type arguments.

  C2? c8;
  C2<int, Function, num, List>?  c9;
  C2<int, Function, num, List>? c10;
  C2<int, Function, int, Null>? c11;
  C2<Null, Null, Null, Null>?   c12;

  C2<int>? c13;
//^^^^^^^^
// [analyzer] COMPILE_TIME_ERROR.WRONG_NUMBER_OF_TYPE_ARGUMENTS
// [cfe] Expected 4 type arguments.
  C2<int, Function>? c14;
//^^^^^^^^^^^^^^^^^^
// [analyzer] COMPILE_TIME_ERROR.WRONG_NUMBER_OF_TYPE_ARGUMENTS
// [cfe] Expected 4 type arguments.
  C2<int, Function, num>? c15;
//^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] COMPILE_TIME_ERROR.WRONG_NUMBER_OF_TYPE_ARGUMENTS
// [cfe] Expected 4 type arguments.
  C2<int, Function, num, List, Null>? c16;
//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] COMPILE_TIME_ERROR.WRONG_NUMBER_OF_TYPE_ARGUMENTS
// [cfe] Expected 4 type arguments.
  C2<int, Function, num, List, Object>? c17;
//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] COMPILE_TIME_ERROR.WRONG_NUMBER_OF_TYPE_ARGUMENTS
// [cfe] Expected 4 type arguments.
  C2<int, Function, num, List, int>? c18;
//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] COMPILE_TIME_ERROR.WRONG_NUMBER_OF_TYPE_ARGUMENTS
// [cfe] Expected 4 type arguments.
  C2<Null, Null, Null, Null, Null>? c19;
//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] COMPILE_TIME_ERROR.WRONG_NUMBER_OF_TYPE_ARGUMENTS
// [cfe] Expected 4 type arguments.
  C2<Null, Null, Null, Null, Null, Null, Null, Null, Null>? c20;
//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] COMPILE_TIME_ERROR.WRONG_NUMBER_OF_TYPE_ARGUMENTS
// [cfe] Expected 4 type arguments.

  C3? c21;
  C3<int, int, int>? c22;
  C3<dynamic, dynamic, dynamic>? c23;
  C3<dynamic, dynamic>? c24;
//^^^^^^^^^^^^^^^^^^^^^
// [analyzer] COMPILE_TIME_ERROR.WRONG_NUMBER_OF_TYPE_ARGUMENTS
// [cfe] Expected 3 type arguments.
  C3<dynamic, dynamic, dynamic, dynamic>? c25;
//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] COMPILE_TIME_ERROR.WRONG_NUMBER_OF_TYPE_ARGUMENTS
// [cfe] Expected 3 type arguments.
  C3<dynamic, dynamic, dynamic, dynamic, dynamic, dynamic, dynamic, dynamic>? c26;
//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] COMPILE_TIME_ERROR.WRONG_NUMBER_OF_TYPE_ARGUMENTS
// [cfe] Expected 3 type arguments.
}
