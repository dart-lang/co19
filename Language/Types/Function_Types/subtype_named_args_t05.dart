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
 * @description Checks that function type t1 is not a subtype of function type
 * t2 if the type of a single named optional parameter of t1 is not assignable
 * to the type of t2's single named optional parameter.
 * @author rodionov
 * @reviewer kaigorodov
 */
import "../../../Utils/expect.dart";

class A {}
class B {}

typedef t1({int p});
typedef t2({A p});
typedef t3({List<A> p});
typedef t4({t1 p});

main() {
  Expect.isFalse(({double p}) {} is t1);
  Expect.isFalse(({bool p}) {} is t1);
  Expect.isFalse(({A p}) {} is t1);
  Expect.isFalse(({List<int> p}) {} is t1);
  Expect.isFalse(({t2 p}) {} is t1);

  Expect.isFalse(({double p}) {} is t2);
  Expect.isFalse(({bool p}) {} is t2);
  Expect.isFalse(({List<int> p}) {} is t2);
  Expect.isFalse(({t2 p}) {} is t2);
  Expect.isFalse(({B p}) {} is t2);

  Expect.isFalse(({double p}) {} is t3);
  Expect.isFalse(({bool p}) {} is t3);
  Expect.isFalse(({A p}) {} is t3);
  Expect.isFalse(({List<int> p}) {} is t3);
  Expect.isFalse(({List<B> p}) {} is t3);
  Expect.isFalse(({t2 p}) {} is t3);

  Expect.isFalse(({double p}) {} is t4);
  Expect.isFalse(({bool p}) {} is t4);
  Expect.isFalse(({A p}) {} is t4);
  Expect.isFalse(({List<int> p}) {} is t4);
  Expect.isFalse(({t2 p}) {} is t4);
  Expect.isFalse(({t3 p}) {} is t4);
  Expect.isFalse(({t4 p}) {} is t4);
}
