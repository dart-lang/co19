/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion We say that a type T0 is a subtype of a type T1 (written T0 <: T1)
 * when:
 * Type Variable Reflexivity 1: T0 is a type variable X0 or a promoted type
 * variables X0 & S0 and T1 is X0
 * @description Check that if type T0 a promoted type variables X0 & S0 and T1
 * is X0 then T0 is a subtype of T1.
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
class X0 {
  const X0();
}
class S0 extends X0 {
}

//# @T0 = S0
//# @T1 = X0

S0 t0Instance = new S0();
X0 t1Instance = new X0();

const t1Default = const X0();

//# <!-- Global variables & classes definition -->

test<T>(T t0Instance) {
  if (t0Instance is S0) {
  //# <!-- Test body -->
  }
}

main() {
  test<S0>(t0Instance);
}
