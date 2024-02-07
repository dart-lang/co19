// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We say that a type T0 is a subtype of a type T1 (written T0 <: T1)
/// when:
/// Right Nullable: if T1 is S1? then:
///  T0 <: T1 iff any of the following hold:
///  either T0 <: S1
///  or T0 <: Null
///  or T0 is X0 and X0 has bound S0 and S0 <: T1
///  or T0 is X0 & S0 and S0 <: T1
/// @description Check that if type T1 is S1? and T0 is X0 and X0 has bound S0
/// and S0 <: T1 then T0 is subtype of T1.
/// @author sgrekhov@unipro.ru


class S1 {
  const S1();
}

class S0 extends S1 {}

S0 t0Instance = new S0();
S1? t1Instance = new S1();

const t1Default = const S1();

//# @T0 = S0
//# @T1 = S1?

//# <!-- Global variables & classes definition -->

test<T extends S1>(T t0Instance) {
//# <!-- Test body -->
}

main() {
  test<S0>(t0Instance);
}
