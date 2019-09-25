/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion We say that a type T0 is a subtype of a type T1 (written T0 <: T1)
 * when:
 * Left FutureOr: T0 is FutureOr<S0>
 *   and Future<S0> <: T1
 *   and S0 <: T1
 * @description Check that if a type T0 is FutureOr<S0> and Future<S0> and S0
 * are subtypes of a type T1, then a type T0 is a subtype of a type T1. Case
 * when an instance of T0 is an instance of S0 type.
 * @author ngl@unipro.ru
 */
/**
 * @description Check that if type T0 is a subtype of a type T1, then instance
 * of T0 can be be assigned to the to global variable of type T1
 * @author sgrekhov@unipro.ru
 */
/*
 * This test is generated from left_FutureOr_A01.dart and 
 * global_variable_x01.dart.
 * Don't modify it. If you want to change this file, change one of the files 
 * above and then run generator.dart to regenerate the tests.
 */


// SharedOptions=--enable-experiment=non-nullable
import "dart:async";

class C {
  const C();
}
class S0 extends C {}

FutureOr<S0> t0Instance = new S0();
FutureOr<C> t1Instance = new Future<C>.value(new C());

const t1Default = const C();




class GlobalVariableTest {
  GlobalVariableTest() {
    t1Instance = t0Instance;
  }

  foo() {
    t1Instance = t0Instance;
  }

  static test() {
    t1Instance = t0Instance;
  }
}

main() {
  bar () {
    t1Instance = t0Instance;
  }

  t1Instance = t0Instance;
  bar();
  GlobalVariableTest t = new GlobalVariableTest();
  t.foo();
  GlobalVariableTest.test();
}
