/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The function type (T1, ... Tn, [Tx1 x1, ..., Txk xk]) -> T is a subtype of the function
 * type (S1, ..., Sn, [Sy1 y1, ..., Sym ym ]) -> S, if all of the following conditions are met:
 * 1. Either S is void, or T <=> S.
 * 2. For all i 1 <= i <= n, Ti <=> Si.
 * 3. k >= m and xi = yi , for each i in 1..m.
 * 4. For all y, {y1 , . . . , ym} Sy <=> Ty
 * @description Checks that function type t1 is not a subtype of function type t2 if number of optional parameters of t2
 * is greater than number of optional parameters of t1.
 * @author iefremov
 */

typedef f1([int x]);
typedef f2([int x, int y]);
typedef f3([int x, int y, int z]);

main() {
  Expect.isFalse(f(){} is f1);
  Expect.isFalse(f([int x]){} is f2);
  Expect.isFalse(f([int x, int y]){} is f3);
}
