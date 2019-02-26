/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A generic class declaration introduces a generic class into the 
 * enclosing library scope. A generic class is a mapping that accepts a list of
 * actual type arguments and maps them to a class. Consider a generic class
 * declaration [G] named [C] with formal type parameter declarations [X1 extends
 * B1,..., Xm extends Bm], and a parameterized type [T] of the form
 * [C<T1,..., Tl>].
 * ...
 * It is a compile-time error if T is not well-bounded.
 * @description Checks that compile error is thrown for the case with one type
 * argument
 * @author iarkh@unipro.ru
 */

class A<T> {}
class C<T extends C<T>> {}

main() {
  A<int> a1;
  A<C> a2;
  A<C<Null>> a3;
  A<C<dynamic>> a4;

  A<C<int>> a5;                //# 01: compile-time error
  A<C<C<int>>> a6;             //# 02: compile-time error
  A<C<C<C<C<C<C<int>>>>>>> a7; //# 03: compile-time error

  C<C<int>> c1;                //# 04: compile-time error
  C<C<C<int>>> c2;             //# 05: compile-time error
  C<C<C<C<C<C<C<int>>>>>>> c3; //# 06: compile-time error
}

