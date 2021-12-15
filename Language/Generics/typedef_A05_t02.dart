// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A generic type alias is a declaration [D] of one of the following
/// forms:
///   S0 Function(T1, . . . , Tn, [Tn+1, . . . , Tn+k])
///   S0 Function(T1, . . . , Tn, {Tn+1 xn+1, . . . , Tn+k xn+k})
///   ...
/// [D] introduces a mapping from actual type argument lists to types.
/// @description Checks that [D] maps argument list to types
/// @author iarkh@unipro.ru

import "../../Utils/expect.dart";

class X {}
class Y extends X {}

T checkme1<T>(expected, ret) {
  Expect.equals(expected, T);
  return ret;
}

T checkme2<T extends X>(expected, ret) {
  Expect.equals(expected, T);
  return ret;
}

T checkme3<T extends Y>(expected, ret) {
  Expect.equals(expected, T);
  return ret;
}

typedef T Test1<T>(dynamic d1, dynamic d2);
typedef T Test2<T extends X>(dynamic d1, dynamic d2);

main() {
  Test1 t1 = checkme1;
  t1(dynamic, 1);

  Test1 t2 = checkme2;
  X x2 = t2(X, X());
  Expect.isTrue(t2(X, x2) is X);
  checkType(checkIs<X>, true, t2(X, x2));

  Test1 t3 = checkme3;
  Y y3 = t3(Y, Y());
  Expect.isTrue(t3(Y, Y()) is Y);
  checkType(checkIs<Y>, true, t3(Y, Y()));

  Test2 t4 = checkme2;
  X x4 = t4(X, X());
  Expect.isTrue(t4(X, x4) is X);
  checkType(checkIs<X>, true, t4(X, x4));

  Test2 t5 = checkme3;
  X y5 = t5(Y, Y());
  Expect.isTrue(t5(Y, y5) is Y);
  checkType(checkIs<Y>, true, t5(Y, y5));

  Test2 t6 = checkme2;
  X x6 = t6(X, X());
  Expect.isTrue(t6(X, x6) is X);
  checkType(checkIs<X>, true, t6(X, x6));
}
