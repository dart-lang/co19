/*
 * Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion We say that a type T0 is a subtype of a type T1 (written T0 <: T1)
 * when:
 * Left Legacy if T0 is S0* then:
 * - T0 <: T1 iff S0 <: T1.
 * @description Check that if type T0 is S0* and S0 is not subtype of T1 then T0
 * is not subtype of T1.
 * @author sgrekhov@unipro.ru
 */
/**
 * @description Check that if type T0 is not a subtype of a type T1, then
 * instance of T0 cannot be be assigned to the to local variable of type T1
 * @author sgrekhov@unipro.ru
 */
/*
 * This test is generated from left_legacy_fail_A01.dart and 
 * local_variable_fail_x01.dart.
 * Don't modify it. If you want to change this file, change one of the files 
 * above and then run generator.dart to regenerate the tests.
 */


import '../../utils/common.dart';
import '../../../../Utils/expect.dart';
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-weak
import "../../utils/legacy_lib.dart";

X t0Instance = new X();
String t1Instance = "Show must go on";

const t1Default = "Lily was here";




class LocalVariableTest {

  LocalVariableTest() {
    String t1 = forgetType(t0Instance);
  }

  LocalVariableTest.valid() {}

  static staticTest() {
    String t1 = forgetType(t0Instance);
  }

  test() {
    String t1 = forgetType(t0Instance);
  }
}

main() {
  bar () {
    String t1 = forgetType(t0Instance);
  }

  Expect.throws(() {
    String t1 = forgetType(t0Instance);
  }, (e) => e is TypeError || e is CastError);

  Expect.throws(() {
    bar();
  }, (e) => e is TypeError || e is CastError);

  Expect.throws(() {
    new LocalVariableTest();
  }, (e) => e is TypeError || e is CastError);

  Expect.throws(() {
    new LocalVariableTest.valid().test();
  }, (e) => e is TypeError || e is CastError);

  Expect.throws(() {
    LocalVariableTest.staticTest();
  }, (e) => e is TypeError || e is CastError);
}
