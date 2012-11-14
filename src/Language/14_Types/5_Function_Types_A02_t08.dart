/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The function type (T1, ... Tn, [Tx1 x1, ..., Txk xk]) -> T is a subtype of the function
 * type (S1, ..., Sn, [Sy1 y1, ..., Sym ym ]) -> S, if all of the following conditions are met:
 * 1. Either S is void, or T <=> S.
 * 2. k >= m and for all i, 1 <= i <= n+m, Ti <=> Si.
 * @description Checks that function type t1 is still a subtype of function type t2 
 * if the names of its positional optional parameters do not match those of t2 as long as the types do.
 * @author iefremov
 * @reviewer rodionov
 */

typedef t2([int x, double y]);

main() {
  Expect.isTrue(([int x, double xx]) {} is t2);
  Expect.isTrue(([int y, double x]) {} is t2);
}
