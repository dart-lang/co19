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
/// 3. k ≥ m and yi ∈ {x1, ..., xk }, i ∈ 1..m.
/// 4. For all yi ∈ {y1, ..., ym }, yi = xj ⇒ Tj ⇐⇒ Si.
/// @description Checks that this statement is true even if the subtype function
/// type has more named optional parameters than the supertype as long it's a
/// superset of the supertype's named optional parameters.
/// This test is like A03/t03, but the order of named parameters is not altered.
/// @author kaigorodov

import "../../../Utils/expect.dart";

class A {}

class A1 {}

class A2 {}

class B implements A, A1, A2 {}

class C implements B {}

class D implements C {}

class G<T, S, U, W> {}

typedef classesFunc(A aa, {A? a, B? b, C? c, D? d});
typedef genericsFunc({Map<num, int>? m, List<List<B>>? l, G<A, B, C, D>? g});
typedef dynamicFunc({var x, var y, var z, var v});
typedef funcFunc({classesFunc? f1, genericsFunc? f2, dynamicFunc? f3});
typedef mixFunc({var x, B? b, G<A, B, C, D>? g, funcFunc? f});

typedef okWithClassesFunc(A aa, {D? a, D? b, D? c, D? d});
typedef okWithGenericsFunc(
    {Map<int, int>? m, List<List<D>>? l, G<D, D, D, D>? g});
typedef okWithDynamicFunc({int? x, bool? y, List<Map>? z, classesFunc? v});

main() {
  Expect.isTrue((var vv, {A? a, B? b, C? c, D? d, Map? xxx, Object? xxxx}) {}
      is classesFunc);
  Expect.runtimeIsType<classesFunc>(
      (var vv, {A? a, B? b, C? c, D? d, Map? xxx, Object? xxxx}) {});

  Expect.isTrue(({Map<num, int>? m, List<List<B>>? l, G<A, B, C, D>? g}) {}
      is genericsFunc);
  Expect.runtimeIsType<genericsFunc>(
      ({Map<num, int>? m, List<List<B>>? l, G<A, B, C, D>? g}) {});

  Expect.isFalse((
      {A? x,
      G? y,
      mixFunc? z,
      var v,
      Object? xx,
      List<Map<int, mixFunc>>? xxx,
      mixFunc? xxxx}) {} is dynamicFunc);
  Expect.runtimeIsNotType<dynamicFunc>((
      {A? x,
        G? y,
        mixFunc? z,
        var v,
        Object? xx,
        List<Map<int, mixFunc>>? xxx,
        mixFunc? xxxx}) {});

  Expect.isTrue((
      {okWithClassesFunc? f1,
      okWithGenericsFunc? f2,
      okWithDynamicFunc? f3,
      mixFunc? xx}) {} is funcFunc);
  Expect.runtimeIsType<funcFunc>((
      {okWithClassesFunc? f1,
        okWithGenericsFunc? f2,
        okWithDynamicFunc? f3,
        mixFunc? xx}) {});
}
