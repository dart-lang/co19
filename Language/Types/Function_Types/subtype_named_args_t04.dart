// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The function type (T1, ... Tn, {Tx1 x1, ..., Txk xk}) -> T is a
/// subtype of the function type (S1, ..., Sn, {Sy1 y1, ..., Sym ym }) -> S, if
/// all of the following conditions are met:
/// 1. Either
///    • S is void, Or
///    • T ⇐⇒ S.
/// 2. ∀i ∈ 1..n, Ti ⇐⇒ Si .
/// 3. k ≥ m and yi ∈ {x1 , ..., xk }, i ∈ 1..m.
/// 4. For all yi ∈ {y1 , ..., ym }, yi = xj ⇒ Tj ⇐⇒ Si.
/// @description Checks that this statement is true for quite complex function
/// types: non-dynamic return type and a bunch of required and named optional
/// parameters.
/// @author rodionov
/// @issue 42648

// Requirements=nnbd-strong
import "../../../Utils/expect.dart";

class A {}

class A1 {}

class A2 {}

class B implements A, A1, A2 {}

class C implements B {}

class D implements C {}

typedef B func(Object o);
typedef B t1(int i, B b, Map<int, num> m, var x,
    {required var ox,
    required B ob,
    required List<num> ol,
    required bool obool});

B f1(int i, B b, Map<int, num> m, var x,
        {required extraParam,
        required bool obool,
        required var ox,
        required D ob,
        required List<num>? ol}) =>
    new B();
D f2(int i, D b, Map<int, int> m, func x,
        {required func ox,
        required D ob,
        required List<int> ol,
        required bool obool}) =>
    new D();
C f3(num i, A b, Map<Object, Object> m, var x,
        {required var ox,
        required extraParam,
        required A2 ob,
        required List ol,
        required Object obool}) =>
    new C();
C f4(num i, A b, Map<Object, Object> m, var x,
        {required var ox,
        required A2 ob,
        required List ol,
        required bool obool,
        required A xx,
        required B yy}) =>
    new C();
C f5(int i, A b, Map<Object, Object> m, var x,
        {required ox, required B ob, required List ol, required obool}) =>
    new C();

main() {
  Expect.isFalse(f1 is t1);
  Expect.runtimeIsNotType<t1>(f1);
  Expect.isFalse(f2 is t1);
  Expect.runtimeIsNotType<t1>(f2);
  Expect.isFalse(f3 is t1);
  Expect.runtimeIsNotType<t1>(f3);
  Expect.isFalse(f4 is t1);
  Expect.runtimeIsNotType<t1>(f4);
  Expect.isTrue(f5 is t1);
  Expect.runtimeIsType<t1>(f5);
}
