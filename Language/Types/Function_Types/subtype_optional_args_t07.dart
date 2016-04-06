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
 * @description Checks that function type t1 is not a subtype of function type
 * t2 if it has fewer positional optional parameters and none of them has
 * required parameters.
 * @author iefremov
 * @reviewer rodionov
 * @reviewer iefremov
 */
import "../../../Utils/expect.dart";

typedef t1([int x]);
typedef t2([int x, int y]);
typedef t3([int x, int y, int z]);

main() {
  Expect.isFalse(() {} is t1);

  Expect.isFalse(([int x]) {} is t2);
  Expect.isFalse(([var x]) {} is t2);

  Expect.isFalse(([int x, int y]) {} is t3);
  Expect.isFalse(([var x, var y]) {} is t3);
}
