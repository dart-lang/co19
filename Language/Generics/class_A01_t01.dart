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
/// @description Checks that compile error is thrown for the case with one type
/// argument
/// @author iarkh@unipro.ru


class C<T> {}

main() {
  C? c1;

  C<int>?       c2;
  C<List<num>>? c3;
  C<void>?      c4;
  C<Null>?      c5;
  C<C>?         c6;

  C<int, int>?                 c7;
//^^^^^^^^^^^^
// [analyzer] COMPILE_TIME_ERROR.WRONG_NUMBER_OF_TYPE_ARGUMENTS
// [cfe] Expected 1 type arguments.
  C<dynamic, dynamic>?         c8;
//^^^^^^^^^^^^^^^^^^^^
// [analyzer] COMPILE_TIME_ERROR.WRONG_NUMBER_OF_TYPE_ARGUMENTS
// [cfe] Expected 1 type arguments.
  C<int, String, long>?        c9;
//^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  C<int, int, int, int, int>? c10;
//^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] COMPILE_TIME_ERROR.WRONG_NUMBER_OF_TYPE_ARGUMENTS
// [cfe] Expected 1 type arguments.
}
