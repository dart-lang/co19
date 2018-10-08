/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A type T is more specific than a type S, written T << S, if one
 * of the following conditions is met:
 *  • T is S.
 *  • T is ⊥
 *  • S is dynamic.
 *  • S is a direct supertype of T.
 *  • T is a type parameter and S is the upper bound of T.
 *  • T is a type parameter and S is Object.
 *  • T is of the form I<T1, ..., Tn > and S is of the form I <S1, ..., Sn>
 *    and Ti << Si 1 <= i <= n.
 *  • T and S are both function types, and T << S under the rules of section
 *    (Types/Function Types).
 *  • T is a function type and S is Function.
 *  • T << U and U << S.
 * << is a partial order on types. T is a subtype of S, written T <: S, iff
 * [⊥/Dynamic]T << S.
 * . . .
 * An interface type T may be assigned to a type S, written T <=> S, if either
 * T <: S or S <: T.
 * @description Checks that function type T is a subtype of itself and
 * T is assignable to itself.
 * @author iefremov
 * @reviewer rodionov
 */
import "../../../Utils/expect.dart";

typedef void t1();
typedef num t2();
typedef t3();
typedef t4(var x);
typedef int t5(var x);
typedef String t6(var x, int y);
typedef t1 t7(t2 x, t3 y);
typedef t7 t8(t7 x, [t7 y]);
typedef void t9([var x]);
typedef int t10([int x]);
typedef List t11(int x, int y, List z, Map<String, Object> m);
typedef List t12(int x, [int y, List z, Map<String, Object> m]);
typedef List<Map<int, List<List<int>>>>
        t13(int x, var v, [int y, List z, Map<String, List<int>> m]);
typedef t13 t14(t13 a, [t13 b]);

void f1() {}
num f2() {}
f3() {}
f4(var x) {}
int f5(var x) {}
String f6(var x, int y) {}
t1 f7(t2 x, t3 y) {}
t7 f8(t7 x, [t7 y]) {}
void f9([var x]) {}
int f10([int x]) {}
List f11(int x, int y, List z, Map<String, Object> m) {}
List f12(int x, [int y, List z, Map<String, Object> m]) {}
List<Map<int, List<List<int>>>> f13(int x, var v, [int y, List z, Map<String, List<int>> m]) {}
t13 f14(t13 a, [t13 b]) {}

class Checker<T> {
  Checker() {}

  check(T x) {
    Expect.isTrue(x is T);
    T t = x;
    check2(x);
  }

  check2(dynamic x) {
    T t = x;
  }
}

main() {
  new Checker<t1>().check(f1);
  new Checker<t2>().check(f2);
  new Checker<t3>().check(f3);
  new Checker<t4>().check(f4);
  new Checker<t5>().check(f5);
  new Checker<t6>().check(f6);
  new Checker<t7>().check(f7);
  new Checker<t8>().check(f8);
  new Checker<t9>().check(f9);
  new Checker<t10>().check(f10);
  new Checker<t11>().check(f11);
  new Checker<t12>().check(f12);
  new Checker<t13>().check(f13);
  new Checker<t14>().check(f14);
}
