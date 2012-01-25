/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A class (7), interface (8) or type alias may be generic.
 * typeParameter: identifier (extends type)? ;
 * typeParameters: '<' typeParameter (',' typeParameter)* '>' ;
 * @description Checks various correct generic interface declarations.
 * @author iefremov
 * @needsreview issue 964
 */

interface I{}

interface I1<T extends T>{}
interface I2<$, $$, $$$>{}
interface I3<T extends I1<T>, S extends I, V extends Function>{}
interface I4<T extends I3<U, S, V>, U extends I1<U>, V extends Function, S extends I>{}
interface I5<T extends I1<List<List<List<List>>>>>{}
interface I6<T extends I1<I6>>{}
interface I7<t extends I7<I7<I7<I7<I7<I7<I7<I7<I7<I7<I7<I7<I7<I7<I7<I7<I7<I7<I7<I7<I7>>>>>>>>>>>>>>>>>>>>>{}

class C1 implements I1{}
class C2 implements I2{}
class C3 implements I3{}
class C4 implements I4{}
class C5 implements I5{}
class C6 implements I{}
class C7 implements I7{}

main() {
  new C1();
  new C2();
  new C3();
  new C4();
  new C5();
  new C6();
  new C7();
  new M();
}

interface ManyParameters<
T0,T1,T2,T3,T4,T5,T6,T7,T8,T9,T10,T11,T12,T13,T14,T15,T16,T17,T18,T19,T20,T21,T22,T23,T24,T25,T26,T27,T28,T29,T30,T31,
T32,T33,T34,T35,T36,T37,T38,T39,T40,T41,T42,T43,T44,T45,T46,T47,T48,T49,T50,T51,T52,T53,T54,T55,T56,T57,T58,T59,T60,
T61,T62,T63,T64,T65,T66,T67,T68,T69,T70,T71,T72,T73,T74,T75,T76,T77,T78,T79,T80,T81,T82,T83,T84,T85,T86,T87,T88,T89,
T90,T91,T92,T93,T94,T95,T96,T97,T98,T99,T100,T101
>{}

class M implements ManyParameters{}