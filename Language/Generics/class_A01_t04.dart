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
 * @description Checks that compile error is thrown for the case with many
 * type arguments
 * @author iarkh@unipro.ru
 */

class ManyParameters<
    T0,T1,T2,T3,T4,T5,T6,T7,T8,T9,T10,T11,T12,T13,T14,T15,T16,T17,T18,T19,T20,
    T21,T22,T23,T24,T25,T26,T27,T28,T29,T30,T31,T32,T33,T34,T35,T36,T37,T38,
    T39,T40,T41,T42,T43,T44,T45,T46,T47,T48,T49,T50,T51,T52,T53,T54,T55,T56,
    T57,T58,T59,T60,T61,T62,T63,T64,T65,T66,T67,T68,T69,T70,T71,T72,T73,T74,
    T75,T76,T77,T78,T79,T80,T81,T82,T83,T84,T85,T86,T87,T88,T89,T90,T91,T92,
    T93,T94,T95,T96,T97,T98,T99,T100,T101> {}

main() {
  new ManyParameters();
  new ManyParameters<int, int, int, int, int, int, int, int, int, int, int, int,
        int, int, int, int, int, int, int, int, int, int, int, int, int, int,
        int, int, int, int, int, int, int, int, int, int, int, int, int, int,
        int, int, int, int, int, int, int, int, int, int, int, int, int, int,
        int, int, int, int, int, int, int, int, int, int, int, int, int, int,
        int, int, int, int, int, int, int, int, int, int, int, int, int, int,
        int, int, int, int, int, int, int, int, int, int, int, int, int, int,
        int, int, int, int, int, int>();

  new ManyParameters<int>();           //# 01: compile-time error
  new ManyParameters<int, int>();      //# 02: compile-time error
  new ManyParameters<int, int, int>(); //# 03: compile-time error

  new ManyParameters<int, int, int, int, int, int, int, int, int, int, int, int, //# 04: compile-time error
      int, int, int, int, int, int, int, int, int, int, int, int, int, int,      //# 04: compile-time error
      int, int, int, int, int, int, int, int, int, int, int, int, int, int,      //# 04: compile-time error
      int, int, int, int, int, int, int, int, int, int, int, int, int, int,      //# 04: compile-time error
      int, int, int, int, int, int, int, int, int, int, int, int, int, int,      //# 04: compile-time error
      int, int, int, int, int, int, int, int, int, int, int, int, int, int,      //# 04: compile-time error
      int, int, int, int, int, int, int, int, int, int, int, int, int, int,      //# 04: compile-time error
      int, int, int, int>();                                                     //# 04: compile-time error

  new ManyParameters<int, int, int, int, int, int, int, int, int, int, int, int, //# 05: compile-time error
      int, int, int, int, int, int, int, int, int, int, int, int, int, int,      //# 05: compile-time error
      int, int, int, int, int, int, int, int, int, int, int, int, int, int,      //# 05: compile-time error
      int, int, int, int, int, int, int, int, int, int, int, int, int, int,      //# 05: compile-time error
      int, int, int, int, int, int, int, int, int, int, int, int, int, int,      //# 05: compile-time error
      int, int, int, int, int, int, int, int, int, int, int, int, int, int,      //# 05: compile-time error
      int, int, int, int, int, int, int, int, int, int, int, int, int, int,      //# 05: compile-time error
      int, int, int, int, int>();                                                //# 05: compile-time error

  new ManyParameters<int, int, int, int, int, int, int, int, int, int, int, int, //# 06: compile-time error
      int, int, int, int, int, int, int, int, int, int, int, int, int, int,      //# 06: compile-time error
      int, int, int, int, int, int, int, int, int, int, int, int, int, int,      //# 06: compile-time error
      int, int, int, int, int, int, int, int, int, int, int, int, int, int,      //# 06: compile-time error
      int, int, int, int, int, int, int, int, int, int, int, int, int, int,      //# 06: compile-time error
      int, int, int, int, int, int, int, int, int, int, int, int, int, int,      //# 06: compile-time error
      int, int, int, int, int, int, int, int, int, int, int, int, int, int,      //# 06: compile-time error
      int, int, int, int, int, int, int>();                                      //# 06: compile-time error

  new ManyParameters<int, int, int, int, int, int, int, int, int, int, int, int, //# 07: compile-time error
      int, int, int, int, int, int, int, int, int, int, int, int, int, int,      //# 07: compile-time error
      int, int, int, int, int, int, int, int, int, int, int, int, int, int,      //# 07: compile-time error
      int, int, int, int, int, int, int, int, int, int, int, int, int, int,      //# 07: compile-time error
      int, int, int, int, int, int, int, int, int, int, int, int, int, int,      //# 07: compile-time error
      int, int, int, int, int, int, int, int, int, int, int, int, int, int,      //# 07: compile-time error
      int, int, int, int, int, int, int, int, int, int, int, int, int, int,      //# 07: compile-time error
      int, int, int, int, int, int, int, int>();                                 //# 07: compile-time error
}

