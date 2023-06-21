// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We say that a type T0 is a subtype of a type T1 (written
/// T0 <: T1) when:
/// Function Type/Function: T0 is a function type and T1 is Function
///
/// @description Check that if type `T0` is a function type with a covariant
/// arguments and `T1` is a function type with arguments that are supertypes of
/// `T0` arguments, then `T0` is a subtype of `T1`.
/// @author sgrekhov22@gmail.com
///
/// @description Check that if type T0 is a subtype of a type T1, then instance
/// of T0 can be used as a return value of type T1
/// @author sgrekhov@unipro.ru
///
/// This test is generated from test_types/function_type_covariant_arg_A02.dart and 
/// test_cases/return_value_x01.dart. Don't modify it! 
/// If you need to change this test, then change one of the files above and then 
/// run generator/generator.dart to regenerate the tests.

import '../../utils/common.dart';

class A {
  void foo({required num n, Object o = "A"}) => print("A");
}

class C implements A {
  void foo({required covariant int n, covariant String o = "C"}) => print("C");
}

A a = A();
A c = C();
void Function({required num n, Object o}) t0Instance = c.foo;

void baz({required num n, Object o = ""}) {}

void Function({required num n, Object o}) returnValueFunc() => forgetType(t0Instance);

class ReturnValueTest {
  static void Function({required num n, Object o}) staticTestMethod() => forgetType(t0Instance);

  void Function({required num n, Object o}) testMethod() => forgetType(t0Instance);

  void Function({required num n, Object o}) get testGetter => forgetType(t0Instance);
}

class ReturnValueGen<X> {
  X testMethod() => forgetType(t0Instance);
  X get testGetter => forgetType(t0Instance);
}

main() {
  void Function({required num n, Object o}) returnValueLocalFunc() => forgetType(t0Instance);

  returnValueFunc();
  returnValueLocalFunc();

  ReturnValueTest.staticTestMethod();

  new ReturnValueTest().testMethod();
  new ReturnValueTest().testGetter;

  // Test type parameters

  new ReturnValueGen<void Function({required num n, Object o})>().testMethod();
  new ReturnValueGen<void Function({required num n, Object o})>().testGetter;
}
