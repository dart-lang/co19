// Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We say that a type T0 is a subtype of a type T1 (written T0 <: T1)
/// when:
/// Function Type/Function: T0 is a function type and T1 is Function
/// @description Check that if type T0 is a function type and T1 is Function then
/// T0 is a subtype of T1. Test void generic function with named arguments
/// @author sgrekhov@unipro.ru
///
/// @description Check that if type T0 is a subtype of a type T1, then instance
/// of T0 can be used as a return value of type T1
/// @author sgrekhov@unipro.ru
///
/// This test is generated from function_type_function_A17.dart and 
/// return_value_x01.dart.
/// Don't modify it. If you want to change this test, change one of the files 
/// above and then run generator.dart to regenerate the tests.



class C {}

typedef void T0<X>(C c, {required X x});
void t0Func<X>(C c, {required X x}) {}

T0<C> t0Instance = t0Func;
Function t1Instance = () {};

void foo() {}
const t1Default = foo;




Function returnValueFunc() => t0Instance;

class ReturnValueTest {
  static Function staticTestMethod() => t0Instance;

  Function testMethod() => t0Instance;

  Function get testGetter => t0Instance;
}

main() {
  Function returnValueLocalFunc() => t0Instance;

  returnValueFunc();
  returnValueLocalFunc();

  ReturnValueTest.staticTestMethod();

  new ReturnValueTest().testMethod();
  new ReturnValueTest().testGetter;

}
