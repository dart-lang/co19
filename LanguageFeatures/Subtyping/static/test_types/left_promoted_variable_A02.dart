/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion We say that a type T0 is a subtype of a type T1 (written T0 <: T1)
 * when:
 * Left Promoted Variable: T0 is a promoted type variable X0 & S0
 * and S0 <: T1
 * @description Check that if type T0 is a promoted type variable X0 & S0 and S0
 * is subtype of T1 then T0 is a subtype of T1.
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
class T1 {
  const T1();
}
class X0 {}
class S0 extends X0 implements T1 {}

//# @T0 = X0
//# @T1 = T1

S0 t0Instance = new S0();
T1 t1Instance = new T1();

const t1Default = const T1();

//# <!-- Global variables & classes definition -->

test<T>(T t0Instance) {
  if (t0Instance is S0) {
  //# <!-- Test body -->
  }
}

main() {
  test<S0>(t0Instance);
}
