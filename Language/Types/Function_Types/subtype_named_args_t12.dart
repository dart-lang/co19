/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The function type (T1, ... Tn, {Tx1 x1, ..., Txk xk}) -> T is a
 * subtype of the function type (S1, ..., Sn, {Sy1 y1, ..., Sym ym }) -> S, if
 * all of the following conditions are met:
 * 1. Either
 *    • S is void, Or
 *    • T ⇐⇒ S.
 * 2. ∀i ∈ 1..n, Ti ⇐⇒ Si .
 * 3. k ≥ m and yi ∈ {x1 , ..., xk }, i ∈ 1..m.
 * 4. For all yi ∈ {y1 , ..., ym }, yi = xj ⇒ Tj ⇐⇒ Si.
 * @description Checks that this statement is true for quite complex function
 * types: non-dynamic return type and a bunch of required and named optional
 * parameters.
 * This test is like A03/t04, but the order of named parameters is not altered.
 * @author kaigorodov
 * @reviewer rodionov
 */
import "../../../Utils/expect.dart";

class A {}
class A1 {}
class A2 {}
class B implements A, A1, A2 {}
class C implements B {}
class D implements C {}

typedef B func(Object o);
typedef B t1(int i, B b, Map<int, num> m, var x,
             {var ox, B ob, List<num> ol, bool obool});

B f1(int i, B b, Map<int, num> m, var x,
     {var ox, D ob, List<num> ol, bool obool, extraParam}) {}
D f2(int i, D b, Map<int, int> m, func x,
     {func ox, D ob, List<int> ol, bool obool}) {}
C f4(num i, A b, Map<Object, Object> m, var x,
     {var ox, A2 ob, List ol, bool obool, A xx, B yy}) {}

main() {
  Expect.isTrue(f1 is t1);
  Expect.isTrue(f2 is t1);
  Expect.isTrue(f4 is t1);
}
