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
 * t2 if they have different number of required parameters.
 * @author rodionov
 * @reviewer kaigorodov
 */
import "../../../Utils/expect.dart";

typedef t1(int x);
typedef t2(int x, int y);

main() {
  Expect.isFalse(() {} is t1);
  Expect.isFalse((int x, var y) {} is t1);
  Expect.isFalse((int x, int y) {} is t1);
  Expect.isFalse(({int x}) {} is t1);
  Expect.isFalse(({var x}) {} is t1);

  Expect.isFalse(() {} is t2);
  Expect.isFalse((int x) {} is t2);
  Expect.isFalse((int y) {} is t2);
  Expect.isFalse((int x, {int y}) {} is t2);
  Expect.isFalse(({int x, int y}) {} is t2);
  Expect.isFalse((int x, int y, int z) {} is t2);
}
