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
 * @description Checks that function type t1 is still a subtype of function type
 * t2 if their named optional parameters have identical names and mutually
 * assignale types, regardless of the order they're declared in.
 * @author rodionov
 * @reviewer kaigorodov
 */
import "../../../Utils/expect.dart";

typedef t1({int x, double d, String s});

main() {
  Expect.isTrue(({int x, String s, double d}) {} is t1);
  Expect.isTrue(({double d, int x, String s}) {} is t1);
  Expect.isTrue(({double d, String s, int x}) {} is t1);
  Expect.isTrue(({String s, double d, int x}) {} is t1);
  Expect.isTrue(({String s, int x, double d}) {} is t1);
}
