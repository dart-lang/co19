// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We say that a type T0 is a subtype of a type T1 (written
/// T0 <: T1) when:
/// Function Type/Function: T0 is a function type and T1 is Function
///
/// @description Check that tearing-off a method with covariant arguments strips
/// these arguments. Therefore, if `T0` is a function type with covariant
/// arguments and `T0` is a valid override of function type `T1`, but without
/// `covariant` keyword `T0` is not a valid override of `T1`, then `T0` is not a
/// subtype of `T1`
/// @author sgrekhov22@gmail.com
///
/// @description Check that if type T0 is not a subtype of a type T1, then
/// instance of T0 cannot be assigned to the to local variable of type T1.
/// Assignment to local variable is tested.
/// @author sgrekhov@unipro.ru
/// @author ngl@unipro.ru
///
/// This test is generated from test_types/function_type_covariant_arg_fail_A01.dart and 
/// test_cases/local_variable_fail_x01.dart. Don't modify it! 
/// If you need to change this test, then change one of the files above and then 
/// run generator/generator.dart to regenerate the tests.

class A {
  void foo(num n) => print("A");
}

class C implements A {
  void foo(covariant int n) => print("C");
}

C c = C();
void Function(int n) t0Instance = c.foo;

void baz(num n) {}

class LocalVariableTest {
  LocalVariableTest() {
    void Function(num n) t1 = t0Instance;
//           ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }

  test() {
    void Function(num n) t1 = t0Instance;
//           ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }

  static staticTest() {
    void Function(num n) t1 = t0Instance;
//           ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

main() {
  void Function(num n) t1 = t0Instance;
//         ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  bar () {
    void Function(num n) t1 = t0Instance;
//           ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}
