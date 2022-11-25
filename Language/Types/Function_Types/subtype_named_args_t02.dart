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
/// @description Checks that this statement is true for functions with several
/// named optional parameters (class, generic, function, Dynamic).
/// @author rodionov

import "../../../Utils/expect.dart";

class A {}

class A1 {}

class A2 {}

class B implements A, A1, A2 {}

class C implements B {}

class D implements C {}

class G<T, S, U, W> {}

typedef classesFunc({A? a, B? b, C? c, D? d});
typedef genericsFunc({Map<num, int>? m, List<List<B>>? l, G<A, B, C, D>? g});
typedef dynamicFunc({var x, var y, var z, var v});
typedef funcFunc({classesFunc? f1, genericsFunc? f2, dynamicFunc? f3});
typedef mixFunc({var x, B? b, G<A, B, C, D>? g, funcFunc? f});

typedef okWithClassesFunc_1({A? a, A1? b, A1? c, A1? d});
typedef okWithClassesFunc_2({D? a, D? b, D? c, D? d});

typedef okWithGenericsFunc_1(
    {Map<num, num>? m, List<List<A1>>? l, G<A, A1, A1, A1>? g});
typedef okWithGenericsFunc_2(
    {Map<int, int>? m, List<List<D>>? l, G<D, D, D, D>? g});

typedef okWithDynamicFunc_1({A? x, G? y, mixFunc z, var v});
typedef okWithDynamicFunc_2({int? x, bool y, List<Map>? z, classesFunc? v});

main() {
  Expect.isFalse(({D? a, B? b, C? c, A? d}) {} is classesFunc);
  Expect.isTrue(({A? a, A? b, A? c, A? d}) {} is classesFunc);
  Expect.isFalse(({D? a, A1? b, A1? c, A1? d}) {} is classesFunc);
  Expect.isFalse(({D? a, A2? b, A2? c, A2? d}) {} is classesFunc);
  Expect.isFalse(({D? a, D? b, D? c, D? d}) {} is classesFunc);
  Expect.isTrue(({var a, var b, var c, var d}) {} is classesFunc);
  Expect.isTrue(
      ({Object? a, Object? b, Object? c, Object? d}) {} is classesFunc);
  Expect.runtimeIsNotType<classesFunc>(({D? a, B? b, C? c, A? d}) {});
  Expect.runtimeIsType<classesFunc>(({A? a, A? b, A? c, A? d}) {});
  Expect.runtimeIsNotType<classesFunc>(({D? a, A1? b, A1? c, A1? d}) {});
  Expect.runtimeIsNotType<classesFunc>(({D? a, A2? b, A2? c, A2? d}) {});
  Expect.runtimeIsNotType<classesFunc>(({D? a, D? b, D? c, D? d}) {});
  Expect.runtimeIsType<classesFunc>(({var a, var b, var c, var d}) {});
  Expect.runtimeIsType<classesFunc>(
      ({Object? a, Object? b, Object? c, Object? d}) {});

  Expect.isTrue(({Map<num, num>? m, List<List<A1>>? l, G<A, A1, A1, A1>? g}) {}
      is genericsFunc);
  Expect.isFalse(({Map<int, int>? m, List<List<D>>? l, G<D, D, D, D>? g}) {}
      is genericsFunc);
  Expect.isTrue(({var m, var l, var g}) {} is genericsFunc);
  Expect.isTrue(({Object? m, Object? l, Object? g}) {} is genericsFunc);
  Expect.runtimeIsType<genericsFunc>(
      ({Map<num, num>? m, List<List<A1>>? l, G<A, A1, A1, A1>? g}) {});
  Expect.runtimeIsNotType<genericsFunc>(
      ({Map<int, int>? m, List<List<D>>? l, G<D, D, D, D>? g}) {});
  Expect.runtimeIsType<genericsFunc>(({var m, var l, var g}) {});
  Expect.runtimeIsType<genericsFunc>(({Object? m, Object? l, Object? g}) {});

  Expect.isFalse(({A? x, G? y, mixFunc? z, var v}) {} is dynamicFunc);
  Expect.isFalse(
      ({int? x, bool? y, List<Map>? z, classesFunc? v}) {} is dynamicFunc);
  Expect.runtimeIsNotType<dynamicFunc>(({A? x, G? y, mixFunc? z, var v}) {});
  Expect.runtimeIsNotType<dynamicFunc>(
      ({int? x, bool? y, List<Map>? z, classesFunc? v}) {});

  Expect.isFalse((
      {okWithClassesFunc_1? f1,
      okWithGenericsFunc_1? f2,
      okWithDynamicFunc_1? f3}) {} is funcFunc);
  Expect.isTrue((
      {okWithClassesFunc_2? f1,
      okWithGenericsFunc_2? f2,
      okWithDynamicFunc_2? f3}) {} is funcFunc);
  Expect.runtimeIsNotType<funcFunc>((
      {okWithClassesFunc_1? f1,
      okWithGenericsFunc_1? f2,
      okWithDynamicFunc_1? f3}) {});
  Expect.runtimeIsType<funcFunc>((
      {okWithClassesFunc_2? f1,
      okWithGenericsFunc_2? f2,
      okWithDynamicFunc_2? f3}) {});
}
