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

void checkme1<T>(expected, {T t}) {
  Expect.equals(expected, T);
}

void checkme2<T extends X>(expected, {T t}) {
  Expect.equals(expected, T);
}

void checkme3<T extends Y>(expected, {T t}) {
  Expect.equals(expected, T);
}

typedef void Test1<T>(dynamic, {T t});
typedef void Test2<T extends X>(dynamic, {T t});

main() {
  Test1 t1 = checkme1;
  t1(dynamic, t: null);
  t1(dynamic);

  Test1<X> t2 = checkme2;
  t2(X, t: X());
  t2(X);

  Test1<Y> t3 = checkme3;
  t3(Y, t: Y());
  t3(Y);

  Test2 t4 = checkme1;
  t4(X, t: X());
  t4(X);

  Test2 t5 = checkme2;
  t5(X, t: X());
  t5(X);

  Test2 t6 = checkme2;
  t6(X, t: Y());
  t6(X);
}
