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
/// @description Checks that this statement is true for functions with a single
/// named optional parameter (class, generic, function, dynamic).
/// @author rodionov

import "../../../Utils/expect.dart";

class A {}
class B implements A {}
class C implements B {}
class D implements C {}

typedef t1({B? a});
typedef t2({C? c});
typedef t3({int? i});
typedef t4({var v});
typedef t5({Map? m});
typedef t6({Map<int, num>? m});
typedef t7({t1? f});
typedef t8({Object? a});

typedef okWithT1_1({A? a});
typedef okWithT1_2({B? a});
typedef okWithT1_3({C? a});
typedef okWithT1_4({D? a});

main() {
  Expect.isTrue(({A? a}) {} is t1);
  Expect.isTrue(({B? a}) {} is t1);
  Expect.isFalse(({C? a}) {} is t1);
  Expect.isFalse(({D? a}) {} is t1);
  Expect.isTrue(({Object? a}) {} is t1);
  Expect.isTrue(({var a}) {} is t1);
  checkType(checkIs<t1>, true, ({A? a}) {});
  checkType(checkIs<t1>, true, ({B? a}) {});
  checkType(checkIs<t1>, false, ({C? a}) {});
  checkType(checkIs<t1>, false, ({D? a}) {});
  checkType(checkIs<t1>, true, ({Object? a}) {});
  checkType(checkIs<t1>, true, ({var a}) {});

  Expect.isTrue(({A? c}) {} is t2);
  Expect.isTrue(({B? c}) {} is t2);
  Expect.isTrue(({C? c}) {} is t2);
  Expect.isFalse(({D? c}) {} is t2);
  Expect.isTrue(({Object? c}) {} is t2);
  Expect.isTrue(({var c}) {} is t2);
  checkType(checkIs<t2>, true, ({A? c}) {});
  checkType(checkIs<t2>, true, ({B? c}) {});
  checkType(checkIs<t2>, true, ({C? c}) {});
  checkType(checkIs<t2>, false, ({D? c}) {});
  checkType(checkIs<t2>, true, ({Object? c}) {});
  checkType(checkIs<t2>, true, ({var c}) {});

  Expect.isTrue(({num? i}) {} is t3);
  Expect.isTrue(({int? i}) {} is t3);
  Expect.isTrue(({Object? i}) {} is t3);
  Expect.isTrue(({var i}) {} is t3);
  checkType(checkIs<t3>, true, ({num? i}) {});
  checkType(checkIs<t3>, true, ({int? i}) {});
  checkType(checkIs<t3>, true, ({Object? i}) {});
  checkType(checkIs<t3>, true, ({var i}) {});

  Expect.isFalse(({A? v}) {} is t4);
  checkType(checkIs<t4>, false, ({A? v}) {});
  Expect.isFalse(({B? v}) {} is t4);
  checkType(checkIs<t4>, false, ({B? v}) {});
  Expect.isFalse(({C? v}) {} is t4);
  checkType(checkIs<t4>, false, ({C? v}) {});
  Expect.isFalse(({D? v}) {} is t4);
  checkType(checkIs<t4>, false, ({D? v}) {});
  Expect.isTrue(({Object? v}) {} is t4);
  checkType(checkIs<t4>, true, ({Object? v}) {});
  Expect.isTrue(({var v}) {} is t4);
  checkType(checkIs<t4>, true, ({var v}) {});
  Expect.isFalse(({num? v}) {} is t4);
  checkType(checkIs<t4>, false, ({num? v}) {});
  Expect.isFalse(({int? v}) {} is t4);
  checkType(checkIs<t4>, false, ({int? v}) {});
  Expect.isFalse(({Map? v}) {} is t4);
  checkType(checkIs<t4>, false, ({Map? v}) {});
  Expect.isFalse(({Map<List<Map<List, List<int>>>, List>? v}) {} is t4);
  checkType(checkIs<t4>, false, ({Map<List<Map<List, List<int>>>, List>? v}) {});
  Expect.isFalse(({List? v}) {} is t4);
  checkType(checkIs<t4>, false, ({List? v}) {});
  Expect.isFalse(({t8? v}) {} is t4);
  checkType(checkIs<t4>, false, ({t8? v}) {});
  Expect.isFalse(({t7? v}) {} is t4);
  checkType(checkIs<t4>, false, ({t7? v}) {});

  Expect.isTrue(({Map? m}) {} is t5);
  checkType(checkIs<t5>, true, ({Map? m}) {});
  Expect.isFalse(({Map<List, t8>? m}) {} is t5);
  checkType(checkIs<t5>, false, ({Map<List, t8>? m}) {});
  Expect.isTrue(({Object? m}) {} is t5);
  checkType(checkIs<t5>, true, ({Object? m}) {});
  Expect.isTrue(({var m}) {} is t5);
  checkType(checkIs<t5>, true, ({var m}) {});
  Expect.isFalse(({Map<List, List>? m}) {} is t5);
  checkType(checkIs<t5>, false, ({Map<List, List>? m}) {});
  Expect.isFalse(({Map<int, t8>? m}) {} is t5);
  checkType(checkIs<t5>, false, ({Map<int, t8>? m}) {});

  Expect.isTrue(({Map<num, num>? m}) {} is t6);
  checkType(checkIs<t6>, true, ({Map<num, num>? m}) {});
  Expect.isFalse(({Map<int, int>? m}) {} is t6);
  checkType(checkIs<t6>, false, ({Map<int, int>? m}) {});
  Expect.isTrue(({Map? m}) {} is t6);
  checkType(checkIs<t6>, true, ({Map? m}) {});
  Expect.isTrue(({Object? m}) {} is t6);
  checkType(checkIs<t6>, true, ({Object? m}) {});
  Expect.isTrue(({var m}) {} is t6);
  checkType(checkIs<t6>, true, ({var m}) {});

  Expect.isFalse(({okWithT1_1? f}) {} is t7);
  Expect.isTrue(({okWithT1_2? f}) {} is t7);
  Expect.isTrue(({okWithT1_3? f}) {} is t7);
  Expect.isTrue(({okWithT1_4? f}) {} is t7);
  checkType(checkIs<t7>, false, ({okWithT1_1? f}) {});
  checkType(checkIs<t7>, true, ({okWithT1_2? f}) {});
  checkType(checkIs<t7>, true, ({okWithT1_3? f}) {});
  checkType(checkIs<t7>, true, ({okWithT1_4? f}) {});

  Expect.isFalse(({A? a}) {} is t8);
  checkType(checkIs<t8>, false, ({A? a}) {});
  Expect.isFalse(({B? a}) {} is t8);
  checkType(checkIs<t8>, false, ({B? a}) {});
  Expect.isFalse(({C? a}) {} is t8);
  checkType(checkIs<t8>, false, ({C? a}) {});
  Expect.isFalse(({D? a}) {} is t8);
  checkType(checkIs<t8>, false, ({D? a}) {});
  Expect.isTrue(({Object? a}) {} is t8);
  checkType(checkIs<t8>, true, ({Object? a}) {});
  Expect.isTrue(({var a}) {} is t8);
  checkType(checkIs<t8>, true, ({var a}) {});
  Expect.isFalse(({num? a}) {} is t8);
  checkType(checkIs<t8>, false, ({num? a}) {});
  Expect.isFalse(({int? a}) {} is t8);
  checkType(checkIs<t8>, false, ({int? a}) {});
  Expect.isFalse(({Map? a}) {} is t8);
  checkType(checkIs<t8>, false, ({Map? a}) {});
  Expect.isFalse(({Map<List<Map<List, List<int>>>, List>? a}) {} is t8);
  checkType(checkIs<t8>, false, ({Map<List<Map<List, List<int>>>, List>? a}) {});
  Expect.isFalse(({List? a}) {} is t8);
  checkType(checkIs<t8>, false, ({List? a}) {});
}
