// Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We say that a type T0 is a subtype of a type T1 (written T0 <: T1)
/// when:
/// Left Nullable: if T0 is S0? then:
/// - T0 <: T1 iff S0 <: T1 and Null <: T1
/// @description Check that if type T0 is S0? and Null <: T1 but S0 is not
/// subtype T1 then T0 is not subtype of T1.
/// @author sgrekhov@unipro.ru
///
/// @description Check that if type T0 not a subtype of a type T1, then instance
/// of T0 cannot be be used as a return value of type T1
/// @author sgrekhov@unipro.ru
///
/// This test is generated from left_nullable_fail_A02.dart and 
/// return_value_fail_x01.dart.
/// Don't modify it. If you want to change this test, change one of the files 
/// above and then run generator.dart to regenerate the tests.


import '../../utils/common.dart';
import '../../../../Utils/expect.dart';

class T1 {
  const T1();
}
class S0 {
  const S0();
}

S0? t0Instance = new S0();
T1? t1Instance = new T1();

const t1Default = const T1();




T1? returnValueFunc() => forgetType(t0Instance);

class ReturnValueTest {
  static T1? staticTestMethod() => forgetType(t0Instance);

  T1? testMethod() => forgetType(t0Instance);

  T1? get testGetter => forgetType(t0Instance);
}

class ReturnValueGen<X> {
  X testMethod() => forgetType(t0Instance);
  X get testGetter => forgetType(t0Instance);
}

main() {
  T1? returnValueLocalFunc() => forgetType(t0Instance);

  Expect.throws(() {
    returnValueFunc();
  }, (e) => e is TypeError || e is CastError);
  Expect.throws(() {
    returnValueLocalFunc();
  }, (e) => e is TypeError || e is CastError);
  Expect.throws(() {
    ReturnValueTest.staticTestMethod();
  }, (e) => e is TypeError || e is CastError);

  Expect.throws(() {
    new ReturnValueTest().testMethod();
  }, (e) => e is TypeError || e is CastError);
  Expect.throws(() {
    new ReturnValueTest().testGetter;
  }, (e) => e is TypeError || e is CastError);

  // Test type parameters

  //# <-- NotGenericFunctionType
  Expect.throws(() {
    new ReturnValueGen<T1?>().testMethod();
  }, (e) => e is TypeError || e is CastError);
  Expect.throws(() {
    new ReturnValueGen<T1?>().testGetter;
  }, (e) => e is TypeError || e is CastError);
  //# -->
}
