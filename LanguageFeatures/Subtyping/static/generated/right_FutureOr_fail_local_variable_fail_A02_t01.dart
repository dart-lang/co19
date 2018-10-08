/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion We say that a type T0 is a subtype of a type T1 (written T0 <: T1)
 * when:
 * Right FutureOr: T1 is FutureOr<S1> and
 *   either T0 <: Future<S1>
 *   or T0 <: S1
 *   or T0 is X0 and X0 has bound S0 and S0 <: T1
 *   or T0 is X0 & S0 and S0 <: T1
 * @description Check that if a type T1 is Future<S1> and a type T0 is X0 and
 * X0 has bound S0 and S0 is not a subtype of Future<S1> or S1, then a type T0
 * is not a subtype of a type T1.
 * @author ngl@unipro.ru
 */
/**
 * @description Check that if type T0 is not a subtype of a type T1, then
 * instance of T0 cannot be be assigned to the to local variable of type T1.
 * Assignment to local variable is tested.
 * @compile-error
 * @author sgrekhov@unipro.ru
 * @author ngl@unipro.ru
 */
/*
 * This test is generated from right_FutureOr_fail_A02.dart and 
 * local_variable_fail_x01.dart.
 * Don't modify it. If you want to change this file, change one of the files 
 * above and then run generator.dart to regenerate the tests.
 */



import "dart:async";

class S1 {}
class S0 {}
class X0 extends S0 {
}

X0 t0Instance = new X0();
FutureOr<S1> t1Instance = new Future.value(new S1());




class LocalVariableTest {
  LocalVariableTest() {
    FutureOr<S1> t1 = null;
    t1 = t0Instance; //# 03: compile-time error
  }

  LocalVariableTest.valid() {}

  test() {
    FutureOr<S1> t1 = null;
    t1 = t0Instance; //# 04: compile-time error
  }

  static staticTest() {
    FutureOr<S1> t1 = null;
    t1 = t0Instance; //# 05: compile-time error
  }
}

main() {
  FutureOr<S1> t1 = null;
  t1 = t0Instance; //# 01: compile-time error

  bar () {
    FutureOr<S1> t1 = null;
    t1 = t0Instance; //# 02: compile-time error
  }
  bar(); //# 02: compile-time error

  new LocalVariableTest(); //# 03: compile-time error
  new LocalVariableTest.valid().test(); //# 04: compile-time error
  LocalVariableTest.staticTest(); //# 05: compile-time error
}
