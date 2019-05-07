/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A generic type alias is a declaration [D] of one of the following
 * forms:
 *   S0 Function(T1, . . . , Tn, [Tn+1, . . . , Tn+k])
 *   S0 Function(T1, . . . , Tn, {Tn+1 xn+1, . . . , Tn+k xn+k})
 *   ...
 * [D] introduces a mapping from actual type argument lists to types.
 * @description Checks that [D] maps argument list to types
 * @author iarkh@unipro.ru
 */
import "../../Utils/expect.dart";

class X {}
class Y extends X {}

checkme1<T>(expected) { Expect.equals(expected, T); }
checkme2<T extends X>(expected) { Expect.equals(expected, T); }
checkme3<T extends Y>(expected) { Expect.equals(expected, T); }

typedef Test1<T>(dynamic);
typedef Test2<T extends X>(dynamic);

main() {
  Test1 t1 = checkme1;
  t1(dynamic);

  Test1 t2 = checkme2;
  t2(X);

  Test1 t3 = checkme3;
  t3(Y);

  Test2 t4 = checkme3;
  t4(Y);

  Test2 t5 = checkme2;
  t5(X);

  Test2 t6 = checkme3;
  t6(Y);
}
