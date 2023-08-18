// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We say that a type T0 is a subtype of a type T1 (written
/// T0 <: T1) when:
/// Assume that T1, .. Ts are types, and V resolves to an extension type
/// declaration of the following form:
///
/// extension type V<X1 extends B1, .. Xs extends Bs>(T id) ... {
///   ... // Members.
/// }
/// It is then allowed to use V<T1, .. Tk> as a type.
///
/// @description Check that extension type `V` is not a subtype of its
/// representation type
/// @author sgrekhov22@gmail.com
///
/// @description Check that if type T0 not a subtype of a type T1, then it cannot
/// be used as an argument of type T1. Global function required argument is
/// tested.
/// @author sgrekhov@unipro.ru
///
/// This test is generated from test_types/extension_type_fail_A08.dart and
/// test_cases/arguments_binding_fail_x01.dart. Don't modify it!
/// If you need to change this test, then change one of the files above and then
/// run generator/generator.dart to regenerate the tests.

// SharedOptions=--enable-experiment=inline-class

extension type const V(int id) {}

V t1Instance = V(42);
int t0Instance = 0;

const t1Default = const V(42);

namedArgumentsFunc1(V t1, {V t2 = t1Default}) {}
positionalArgumentsFunc1(V t1, [V t2 = t1Default]) {}

class ArgumentsBindingClass {
    ArgumentsBindingClass(V t1) {}

    ArgumentsBindingClass.named(V t1, {V t2 = t1Default}) {}
    ArgumentsBindingClass.positional(V t1, [V t2 = t1Default]) {}

    factory ArgumentsBindingClass.fNamed(V t1, {V t2 = t1Default}) {
        return new ArgumentsBindingClass.named(t1, t2: t2);
    }
    factory ArgumentsBindingClass.fPositional(V t1, [V t2 = t1Default]) {
        return new ArgumentsBindingClass.positional(t1, t2);
    }

    static namedArgumentsStaticMethod(V t1, {V t2 = t1Default}) {}
    static positionalArgumentsStaticMethod(V t1, [V t2 = t1Default]) {}

    namedArgumentsMethod(V t1, {V t2 = t1Default}) {}
    positionalArgumentsMethod(V t1, [V t2 = t1Default]) {}

    set testSetter(V val) {}
}

class ArgumentsBindingClassSuper {
  ArgumentsBindingClassSuper(V t1) {}
}

class ArgumentsBindingDesc extends ArgumentsBindingClassSuper {
  ArgumentsBindingDesc(int t0) : super (t0) {}
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
