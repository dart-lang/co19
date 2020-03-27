/*
 * Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion We say that a type T0 is a subtype of a type T1 (written T0 <: T1)
 * when:
 * Right Promoted Variable: if T1 is a promoted type variable X1 & S1 then:
 * - T0 <: T1 iff T0 <: X1 and T0 <: S1
 * @description Check that if type T1 is a promoted type variables X1 & S1 and
 * T0 <: X1 and T0 <: S1 then T0 is a subtype of T1.
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
class X1 {
  const X1();
}
class S1 extends X1 {
  const S1();
}

class T0 extends S1 {}
//# @T0 = T0
//# @T1 = S1

T0 t0Instance = new T0();
X1 t1Instance = new S1();

const t1Default = const S1();

//# <!-- Global variables & classes definition -->

main() {
  if (t1Instance is S1) {
    //# <!-- Test body -->
  }
}
