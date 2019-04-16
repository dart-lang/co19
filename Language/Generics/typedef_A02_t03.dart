/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A generic type alias is a declaration [D] of one of the following
 * forms:
 * ...
 * m typedef S? id<X1 extends B1, . . . , Xs extends Bs>(
 *   T1 p1, . . . , Tn pn, [Tn+1 pn+1, . . . , Tn+k pn+k]);
 * ...
 * where [m] is derived from metadata, [T] is a type, and [S?] is a type or the
 * empty string. Let [S0] be [S?] if it is a type, otherwise let [S0] be
 * [dynamic]. The associated type of [D], call it [F], is, respectively:
 * ...
 *   S0 Function(T1, . . . , Tn, [Tn+1, . . . , Tn+k])
 * ...
 * @description Checks that function generic type alias declaration can have
 * optional position arguments.
 * @author iarkh@unipro.ru
 */

import "../../Utils/expect.dart";

typedef int test1<T extends num>(int x, [int y]);

int t1<T extends int>(int x, [int y]) {
  return y == null ? x : y;
}

main() {
  test1 res = t1;
  Expect.equals(14, res(1, 14));
  Expect.equals(1, res(1));
}
