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
 * @description Checks that this statement is true for quite complex function
 * types: non-dynamic return type and a bunch of required and positional optional
 * parameters.
 * @author iefremov
 * @reviewer rodionov
 * @reviewer iefremov
 */
import "../../../Utils/expect.dart";

class A {}
class A1 {}
class A2 {}
class B implements A, A1, A2 {}
class C implements B {}
class D implements C {}

typedef B func(Object o);
typedef B t1(int i, B b, Map<int, num> m, var x, [var ox, B ob, List<num> ol, bool obool]);

B f1(int i, B b, Map<int, num> m, var x, [var ox, D ob, List<num> ol, bool obool]) {}
D f2(int i, D b, Map<int, int> m, func x, [func ox, D ob, List<int> ol, bool obool]) {}
C f3(num i, A b, Map<Object, Object> m, var x, [var ox, A2 ob, List ol, Object obool]) {}
C f4(num i, A b, Map<Object, Object> m, var x, [var ox, A2 ob, List ol, bool obool, A xx, B yy]) {}
A f5(num i, A b, Map<Object, Object> m, var x, [var ox, A2 ob, List ol, Object obool]) {}

main() {
  Expect.isTrue(f1 is t1);
  Expect.isTrue(f2 is t1);
  Expect.isTrue(f3 is t1);
  Expect.isTrue(f4 is t1);
  Expect.isTrue(f5 is t1);
}
