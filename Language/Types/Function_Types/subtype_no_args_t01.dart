/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A function type (T1,...Tk,[Tk+1,...,Tn+m]) -> T is a subtype of
 * the function type (S1,...,Sk+j,[Sk+j+1,...,Sn]) -> S, if all of the following
 * conditions are met:
 * 1. Either
 *    • S is void, or
 *    • T <=> S.
 * 2. ∀i ∈ 1..n, Ti ⇐⇒ Si.
 * @description Checks that this statement is true for function types with no
 * arguments: S is void, T is any type.
 * @static-clean to make sure assignments are legal and cause no warnings
 * @author iefremov
 * @reviewer rodionov
 */
import "../../../Utils/expect.dart";

typedef void check_t();

typedef t1();
typedef void t2();
typedef int t3();
typedef String t4();
typedef double t5();
typedef Object t6();
typedef t1 t7();
typedef List t8();
typedef List<int> t9();
typedef Map<int, List<List<List>>> t10();
typedef t10 t11();


class Checker<T extends check_t> {
  Checker(T f) {
    Expect.isTrue(f is check_t);
    //check assignability () -> S = () -> T
    check_t check1 = f;
  }
}

f1() {}
void f2() {}
int f3() {}
String f4() {}
double f5() {}
Object f6() {}
t1 f7() {}
List f8() {}
List<int> f9() {}
Map<int, List<List<List>>> f10() {}
t10 f11() {}

main() {
  new Checker<t1>  (f1);
  new Checker<t2>  (f2);
  new Checker<t3>  (f3);
  new Checker<t4>  (f4);
  new Checker<t5>  (f5);
  new Checker<t6>  (f6);
  new Checker<t7>  (f7);
  new Checker<t8>  (f8);
  new Checker<t9>  (f9);
  new Checker<t10> (f10);
  new Checker<t11> (f11);
}
