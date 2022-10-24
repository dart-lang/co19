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
/// @description Check that if type T1 is S1? and T0 <: S1 then T0 is subtype of
/// T1.
/// @author sgrekhov@unipro.ru
///
/// @description Check that if type T0 is a subtype of a type T1, then instance
/// of T0 can be assigned to the to local variable of type T1
/// @author sgrekhov@unipro.ru
///
/// This test is generated from test_types/right_nullable_A01.dart and 
/// test_cases/local_variable_x01.dart. Don't modify it! 
/// If you need to change this test, then change one of the files above and then 
/// run generator/generator.dart to regenerate the tests.

class S1 {
  const S1();
}
class T0 extends S1 {}

T0 t0Instance = new T0();

class LocalVariableTest {

  LocalVariableTest() {
    S1? t1 = t0Instance;
    t1 = t0Instance;
  }

  static staticTest() {
    S1? t1 = t0Instance;
    t1 = t0Instance;
  }

  test() {
    S1? t1 = t0Instance;
    t1 = t0Instance;
  }
}

main() {
  foo() {
    S1? t1 = t0Instance;
    t1 = t0Instance;
  }

  S1? t1 = t0Instance;
  t1 = t0Instance;
  foo();
  LocalVariableTest x = new LocalVariableTest();
  x.test();
  LocalVariableTest.staticTest();
}
