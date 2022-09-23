// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We say that a type T0 is a subtype of a type T1 (written T0 <: T1)
/// when:
/// Right Object: if T1 is Object then:
///  - if T0 is an unpromoted type variable with bound B then T0 <: T1 iff
///      B <: Object
///  - if T0 is a promoted type variable X & S then T0 <: T1 iff S <: Object
///  - if T0 is FutureOr<S> for some S, then T0 <: T1 iff S <: Object.
///  - if T0 is S* for any S, then T0 <: T1 iff S <: T1
///  - if T0 is Null, dynamic, void, or S? for any S, then the subtyping does
///      not hold (per above, the result of the subtyping query is false).
///  - Otherwise T0 <: T1 is true.
/// @description Check that if T0 is an unpromoted type variable with bound B
/// and B <: Object then T0 is subtype of T1
/// @author sgrekhov@unipro.ru

class B {}
class T0 extends B {}

T0 t0Instance = new T0();
Object t1Instance = new Object();

const t1Default = const Object();

//# @T0 = T0
//# @T1 = Object

//# <!-- Global variables & classes definition -->

test<T extends B>(T t0Instance) {
    //# <!-- Test body -->
}

main() {
  test<T0>(t0Instance);
}
