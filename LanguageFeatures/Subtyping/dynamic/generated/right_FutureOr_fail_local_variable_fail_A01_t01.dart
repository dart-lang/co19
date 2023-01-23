// Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.9

/// @assertion We say that a type T0 is a subtype of a type T1 (written T0 <: T1)
/// when:
/// Right FutureOr: T1 is FutureOr<S1> and
///   either T0 <: Future<S1>
///   or T0 <: S1
///   or T0 is X0 and X0 has bound S0 and S0 <: T1
///   or T0 is X0 & S0 and S0 <: T1
/// @description Check that if a type T1 is FutureOr<S1> and a type T0 is not
/// a subtype of types Future<S1> or S1, then a type T0 is not a subtype of a
/// type T1.
/// @author ngl@unipro.ru
///
/// @description Check that if type T0 is not a subtype of a type T1, then
/// instance of T0 cannot be assigned to the to local variable of type T1
/// @author sgrekhov@unipro.ru
///
/// This test is generated from right_FutureOr_fail_A01.dart and 
/// local_variable_fail_x01.dart.
/// Don't modify it. If you want to change this test, change one of the files 
/// above and then run generator.dart to regenerate the tests.


// @dart = 2.9

import '../../utils/common.dart';
import '../../../../Utils/expect.dart';


import "dart:async";

class S1 {}
class T0 {}

T0 t0Instance = new T0();
FutureOr<S1> t1Instance = new Future.value(new S1());


// @dart = 2.9



class LocalVariableTest {

  LocalVariableTest() {
    FutureOr<S1> t1 = null;
    t1 = forgetType(t0Instance);
  }

  LocalVariableTest.valid() {}

  static staticTest() {
    FutureOr<S1> t1 = null;
    t1 = forgetType(t0Instance);
  }

  test() {
    FutureOr<S1> t1 = null;
    t1 = forgetType(t0Instance);
  }
}

main() {
  bar () {
    FutureOr<S1> t1 = null;
    t1 = forgetType(t0Instance);
  }

  Expect.throws(() {
    FutureOr<S1> t1 = null;
    t1 = forgetType(t0Instance);
  }, (e) => e is TypeError);

  Expect.throws(() {
    bar();
  }, (e) => e is TypeError);

  Expect.throws(() {
    new LocalVariableTest();
  }, (e) => e is TypeError);

  Expect.throws(() {
    new LocalVariableTest.valid().test();
  }, (e) => e is TypeError);

  Expect.throws(() {
    LocalVariableTest.staticTest();
  }, (e) => e is TypeError);
}
