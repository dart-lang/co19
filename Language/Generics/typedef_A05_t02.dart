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

T checkme1<T>(expected) {
  Expect.equals(expected, T);
  return null;
}

T checkme2<T extends X>(expected) {
  Expect.equals(expected, T);
  return T == Y ? Y() : (T == X ? X() : null);
}

T checkme3<T extends Y>(expected) {
  Expect.equals(expected, T);
  return T == Y ? Y() : null;
}

typedef T Test1<T>(dynamic);
typedef T Test2<T extends X>(dynamic);

main() {
  Test1 t1 = checkme1;
  t1(dynamic);

  Test1 t2 = checkme2;
  X x2 = t2(X);
  Expect.isTrue(t2(X) is X);

  Test1 t3 = checkme3;
  Y y3 = t3(Y);
  Expect.isTrue(t3(Y) is Y);

  Test2 t4 = checkme2;
  X x4 = t4(X);
  Expect.isTrue(t4(X) is X);

  Test2 t5 = checkme3;
  Y y5 = t5(Y);
  Expect.isTrue(t5(Y) is Y);

  Test2 t6 = checkme2;
  X x6 = t6(X);
  Expect.isTrue(t6(X) is X);
}
