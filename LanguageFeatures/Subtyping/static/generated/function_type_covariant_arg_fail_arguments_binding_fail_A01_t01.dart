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
/// @description Check that if type T0 not a subtype of a type T1, then it cannot
/// be used as an argument of type T1. Global function required argument is
/// tested.
/// @author sgrekhov@unipro.ru
///
/// This test is generated from test_types/function_type_covariant_arg_fail_A01.dart and 
/// test_cases/arguments_binding_fail_x01.dart. Don't modify it! 
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
void Function(num n) t1Instance = (num n) {};

void baz(num n) {}
const t1Default = baz;

namedArgumentsFunc1(void Function(num n) t1, {void Function(num n) t2 = t1Default}) {}
positionalArgumentsFunc1(void Function(num n) t1, [void Function(num n) t2 = t1Default]) {}

class ArgumentsBindingClass {
    ArgumentsBindingClass(void Function(num n) t1) {}

    ArgumentsBindingClass.named(void Function(num n) t1, {void Function(num n) t2 = t1Default}) {}
    ArgumentsBindingClass.positional(void Function(num n) t1, [void Function(num n) t2 = t1Default]) {}

    factory ArgumentsBindingClass.fNamed(void Function(num n) t1, {void Function(num n) t2 = t1Default}) {
        return new ArgumentsBindingClass.named(t1, t2: t2);
    }
    factory ArgumentsBindingClass.fPositional(void Function(num n) t1, [void Function(num n) t2 = t1Default]) {
        return new ArgumentsBindingClass.positional(t1, t2);
    }

    static namedArgumentsStaticMethod(void Function(num n) t1, {void Function(num n) t2 = t1Default}) {}
    static positionalArgumentsStaticMethod(void Function(num n) t1, [void Function(num n) t2 = t1Default]) {}

    namedArgumentsMethod(void Function(num n) t1, {void Function(num n) t2 = t1Default}) {}
    positionalArgumentsMethod(void Function(num n) t1, [void Function(num n) t2 = t1Default]) {}

    set testSetter(void Function(num n) val) {}
}

class ArgumentsBindingClassSuper {
  ArgumentsBindingClassSuper(void Function(num n) t1) {}
}

class ArgumentsBindingDesc extends ArgumentsBindingClassSuper {
  ArgumentsBindingDesc(void Function(int n) t0) : super (t0) {}
//                                      ^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  namedArgumentsFunc1(t0Instance);
//                    ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  namedArgumentsFunc1(t1Instance, t2: t0Instance);
//                                    ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  positionalArgumentsFunc1(t0Instance);
//                         ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  positionalArgumentsFunc1(t1Instance, t0Instance);
//                                     ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  new ArgumentsBindingClass(t0Instance);
//                          ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  new ArgumentsBindingClass(t1Instance).namedArgumentsMethod(t0Instance);
//                                                           ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  new ArgumentsBindingClass(t1Instance).namedArgumentsMethod(t1Instance, t2: t0Instance);
//                                                                           ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  new ArgumentsBindingClass(t1Instance).positionalArgumentsMethod(t0Instance);
//                                                                ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  new ArgumentsBindingClass(t1Instance).positionalArgumentsMethod(t1Instance, t0Instance);
//                                                                            ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  new ArgumentsBindingClass(t1Instance).testSetter = t0Instance;
//                                                   ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  ArgumentsBindingClass.namedArgumentsStaticMethod(t0Instance);
//                                                 ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  ArgumentsBindingClass.namedArgumentsStaticMethod(t1Instance, t2: t0Instance);
//                                                                 ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  ArgumentsBindingClass.positionalArgumentsStaticMethod(t0Instance);
//                                                      ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  ArgumentsBindingClass.positionalArgumentsStaticMethod(t1Instance, t0Instance);
//                                                                  ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  new ArgumentsBindingClass.named(t0Instance);
//                                ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  new ArgumentsBindingClass.named(t1Instance, t2: t0Instance);
//                                                ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  new ArgumentsBindingClass.positional(t0Instance);
//                                     ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  new ArgumentsBindingClass.positional(t1Instance, t0Instance);
//                                                 ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  new ArgumentsBindingClass.fNamed(t0Instance);
//                                 ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  new ArgumentsBindingClass.fNamed(t1Instance, t2: t0Instance);
//                                                 ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  new ArgumentsBindingClass.fPositional(t0Instance);
//                                      ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  new ArgumentsBindingClass.fPositional(t1Instance, t0Instance);
//                                                  ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
