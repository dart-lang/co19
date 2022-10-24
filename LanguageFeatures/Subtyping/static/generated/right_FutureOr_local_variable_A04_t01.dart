// Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We say that a type T0 is a subtype of a type T1 (written T0 <: T1)
/// when:
/// Right FutureOr: T1 is FutureOr<S1> and
///   either T0 <: Future<S1>
///   or T0 <: S1
///   or T0 is X0 and X0 has bound S0 and S0 <: T1
///   or T0 is X0 & S0 and S0 <: T1
/// @description Check that if a type T1 is S1 and a type T0 is X0 and X0 has
/// bound S0 and S0 <: S1, then a type T0 is a subtype of a type T1.
/// @author ngl@unipro.ru
///
/// @description Check that if type T0 is a subtype of a type T1, then instance
/// of T0 can be assigned to the to local variable of type T1
/// @author sgrekhov@unipro.ru
///
/// This test is generated from test_types/right_FutureOr_A04.dart and 
/// test_cases/local_variable_x01.dart. Don't modify it! 
/// If you need to change this test, then change one of the files above and then 
/// run generator/generator.dart to regenerate the tests.

import "dart:async";

class S1 {
  const S1();
}
class S0 extends S1 {
}
class X0 extends S0 {
}

X0 t0Instance = new X0();

class LocalVariableTest {

  LocalVariableTest() {
    FutureOr<S1> t1 = t0Instance;
    t1 = t0Instance;
  }

  static staticTest() {
    FutureOr<S1> t1 = t0Instance;
    t1 = t0Instance;
  }

  test() {
    FutureOr<S1> t1 = t0Instance;
    t1 = t0Instance;
  }
}

main() {
  foo() {
    FutureOr<S1> t1 = t0Instance;
    t1 = t0Instance;
  }

  FutureOr<S1> t1 = t0Instance;
  t1 = t0Instance;
  foo();
  LocalVariableTest x = new LocalVariableTest();
  x.test();
  LocalVariableTest.staticTest();
}
