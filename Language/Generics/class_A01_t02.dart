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
 * It is a compile-time error if [m != l].
 * @description Checks that compile error is thrown for the case with one type
 * argument
 * @author iarkh@unipro.ru
 */

abstract class I{}

class C1<T extends int> {}

main() {
  C1 c1;

  C1<int>       c2;
  C1<List<num>> c3;
  C1<void>      c4;
  C1<Null>      c5;
  C1<C1>        c6;

  C1<int, int>                c7; //# 01: compile-time error
  C1<int, int, int>           c8; //# 02: compile-time error
  C1<int, int, int, int, int> c9; //# 03: compile-time error
  C1<int, int, int, int, int, int, int, int, int, int, int, int> c10; //# 04: compile-time error
}

