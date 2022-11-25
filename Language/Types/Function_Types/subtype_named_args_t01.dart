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
  Expect.runtimeIsType<t1>(({A? a}) {});
  Expect.runtimeIsType<t1>(({B? a}) {});
  Expect.runtimeIsNotType<t1>(({C? a}) {});
  Expect.runtimeIsNotType<t1>(({D? a}) {});
  Expect.runtimeIsType<t1>(({Object? a}) {});
  Expect.runtimeIsType<t1>(({var a}) {});

  Expect.isTrue(({A? c}) {} is t2);
  Expect.isTrue(({B? c}) {} is t2);
  Expect.isTrue(({C? c}) {} is t2);
  Expect.isFalse(({D? c}) {} is t2);
  Expect.isTrue(({Object? c}) {} is t2);
  Expect.isTrue(({var c}) {} is t2);
  Expect.runtimeIsType<t2>(({A? c}) {});
  Expect.runtimeIsType<t2>(({B? c}) {});
  Expect.runtimeIsType<t2>(({C? c}) {});
  Expect.runtimeIsNotType<t2>(({D? c}) {});
  Expect.runtimeIsType<t2>(({Object? c}) {});
  Expect.runtimeIsType<t2>(({var c}) {});

  Expect.isTrue(({num? i}) {} is t3);
  Expect.isTrue(({int? i}) {} is t3);
  Expect.isTrue(({Object? i}) {} is t3);
  Expect.isTrue(({var i}) {} is t3);
  Expect.runtimeIsType<t3>(({num? i}) {});
  Expect.runtimeIsType<t3>(({int? i}) {});
  Expect.runtimeIsType<t3>(({Object? i}) {});
  Expect.runtimeIsType<t3>(({var i}) {});

  Expect.isFalse(({A? v}) {} is t4);
  Expect.runtimeIsNotType<t4>(({A? v}) {});
  Expect.isFalse(({B? v}) {} is t4);
  Expect.runtimeIsNotType<t4>(({B? v}) {});
  Expect.isFalse(({C? v}) {} is t4);
  Expect.runtimeIsNotType<t4>(({C? v}) {});
  Expect.isFalse(({D? v}) {} is t4);
  Expect.runtimeIsNotType<t4>(({D? v}) {});
  Expect.isTrue(({Object? v}) {} is t4);
  Expect.runtimeIsType<t4>(({Object? v}) {});
  Expect.isTrue(({var v}) {} is t4);
  Expect.runtimeIsType<t4>(({var v}) {});
  Expect.isFalse(({num? v}) {} is t4);
  Expect.runtimeIsNotType<t4>(({num? v}) {});
  Expect.isFalse(({int? v}) {} is t4);
  Expect.runtimeIsNotType<t4>(({int? v}) {});
  Expect.isFalse(({Map? v}) {} is t4);
  Expect.runtimeIsNotType<t4>(({Map? v}) {});
  Expect.isFalse(({Map<List<Map<List, List<int>>>, List>? v}) {} is t4);
  Expect.runtimeIsNotType<t4>(({Map<List<Map<List, List<int>>>, List>? v}) {});
  Expect.isFalse(({List? v}) {} is t4);
  Expect.runtimeIsNotType<t4>(({List? v}) {});
  Expect.isFalse(({t8? v}) {} is t4);
  Expect.runtimeIsNotType<t4>(({t8? v}) {});
  Expect.isFalse(({t7? v}) {} is t4);
  Expect.runtimeIsNotType<t4>(({t7? v}) {});

  Expect.isTrue(({Map? m}) {} is t5);
  Expect.runtimeIsType<t5>(({Map? m}) {});
  Expect.isFalse(({Map<List, t8>? m}) {} is t5);
  Expect.runtimeIsNotType<t5>(({Map<List, t8>? m}) {});
  Expect.isTrue(({Object? m}) {} is t5);
  Expect.runtimeIsType<t5>(({Object? m}) {});
  Expect.isTrue(({var m}) {} is t5);
  Expect.runtimeIsType<t5>(({var m}) {});
  Expect.isFalse(({Map<List, List>? m}) {} is t5);
  Expect.runtimeIsNotType<t5>(({Map<List, List>? m}) {});
  Expect.isFalse(({Map<int, t8>? m}) {} is t5);
  Expect.runtimeIsNotType<t5>(({Map<int, t8>? m}) {});

  Expect.isTrue(({Map<num, num>? m}) {} is t6);
  Expect.runtimeIsType<t6>(({Map<num, num>? m}) {});
  Expect.isFalse(({Map<int, int>? m}) {} is t6);
  Expect.runtimeIsNotType<t6>(({Map<int, int>? m}) {});
  Expect.isTrue(({Map? m}) {} is t6);
  Expect.runtimeIsType<t6>(({Map? m}) {});
  Expect.isTrue(({Object? m}) {} is t6);
  Expect.runtimeIsType<t6>(({Object? m}) {});
  Expect.isTrue(({var m}) {} is t6);
  Expect.runtimeIsType<t6>(({var m}) {});

  Expect.isFalse(({okWithT1_1? f}) {} is t7);
  Expect.isTrue(({okWithT1_2? f}) {} is t7);
  Expect.isTrue(({okWithT1_3? f}) {} is t7);
  Expect.isTrue(({okWithT1_4? f}) {} is t7);
  Expect.runtimeIsNotType<t7>(({okWithT1_1? f}) {});
  Expect.runtimeIsType<t7>(({okWithT1_2? f}) {});
  Expect.runtimeIsType<t7>(({okWithT1_3? f}) {});
  Expect.runtimeIsType<t7>(({okWithT1_4? f}) {});

  Expect.isFalse(({A? a}) {} is t8);
  Expect.runtimeIsNotType<t8>(({A? a}) {});
  Expect.isFalse(({B? a}) {} is t8);
  Expect.runtimeIsNotType<t8>(({B? a}) {});
  Expect.isFalse(({C? a}) {} is t8);
  Expect.runtimeIsNotType<t8>(({C? a}) {});
  Expect.isFalse(({D? a}) {} is t8);
  Expect.runtimeIsNotType<t8>(({D? a}) {});
  Expect.isTrue(({Object? a}) {} is t8);
  Expect.runtimeIsType<t8>(({Object? a}) {});
  Expect.isTrue(({var a}) {} is t8);
  Expect.runtimeIsType<t8>(({var a}) {});
  Expect.isFalse(({num? a}) {} is t8);
  Expect.runtimeIsNotType<t8>(({num? a}) {});
  Expect.isFalse(({int? a}) {} is t8);
  Expect.runtimeIsNotType<t8>(({int? a}) {});
  Expect.isFalse(({Map? a}) {} is t8);
  Expect.runtimeIsNotType<t8>(({Map? a}) {});
  Expect.isFalse(({Map<List<Map<List, List<int>>>, List>? a}) {} is t8);
  Expect.runtimeIsNotType<t8>(({Map<List<Map<List, List<int>>>, List>? a}) {});
  Expect.isFalse(({List? a}) {} is t8);
  Expect.runtimeIsNotType<t8>(({List? a}) {});
}
