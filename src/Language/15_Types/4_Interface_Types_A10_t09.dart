/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A type T is more specific than a type S, written T << S, if T is of the form I<T1, ..., Tn> and
 * S is of the form I<S1, ..., Sn> and: Ti << Si , 1 <= i <= n
 * << is a partial order on types. T is a subtype of S, written T <: S, iff [⊥/Dynamic]T << S.
 * A type T may be assigned to a type S, written T <=> S, if either T <: S or S <: T .
 * @description Checks that GenericType<T> is a subtype of GenericType<S> where T and S are non-trivial functions.
 * @static-clean
 * @author iefremov
 * @reviewer rodionov
 */
import "../../Utils/expect.dart";

class I {}
class J extends I {}
class K extends J {}
class C implements K {}

typedef Map<List, List<Map<num,List>>> complexFunction_t1();
typedef t1_1();
typedef Map<List<int>, List> t1_2();
typedef Map<List<int>, List<Map>> t1_3();
typedef Map<List<complexFunction_t1>, List<Map<int, List<Map<complexFunction_t1, complexFunction_t2>>>>> t1_4();

typedef complexFunction_t1 complexFunction_t2(complexFunction_t1 f1, complexFunction_t1 f2);
typedef t1_1 t2_1(t1_2 f1, t1_3 f2);
typedef t1_3 t2_2(t1_4 f1, t1_1 f2);

typedef K bound(J j, complexFunction_t1 f1, [num i, complexFunction_t2 f2]);
typedef C param1(K j, t1_1 f1, [int i, t2_1 f2]);
typedef K param2(C j, t1_4 f1, [double i, t2_2 f2]);
typedef I param3(J j, t1_2 f1, [double i, t2_2 f2]);
typedef param4(var x, var y, [var i, var f2]);
typedef J param5(I j, t1_1 f1, [Object i, t2_1 f2]);

main() {
  Expect.isTrue(new List<param1>() is List<bound>);
  Expect.isTrue(new List<param2>() is List<bound>);
  Expect.isTrue(new List<param3>() is List<bound>);
  Expect.isTrue(new List<param4>() is List<bound>);
  Expect.isTrue(new List<param5>() is List<bound>);

  List<param1> l1 = new List<bound>();
  List<param2> l2 = new List<bound>();
  List<param3> l3 = new List<bound>();
  List<param4> l4 = new List<bound>();
  List<param5> l5 = new List<bound>();

  List<bound> l6 = new List<param1>();
  List<bound> l7 = new List<param2>();
  List<bound> l8 = new List<param3>();
  List<bound> l9 = new List<param4>();
  List<bound> l10 = new List<param5>();
}
