// Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We say that a type T0 is a subtype of a type T1 (written T0 <: T1)
/// when:
/// Right Object: if T1 is Object then:
///  - if T0 is an unpromoted type variable with bound B then T0 <: T1 iff
///      B <: Object
///  - if T0 is a promoted type variable X & S then T0 <: T1 iff S <: Object
///  - if T0 is FutureOr<S> for some S, then T0 <: T1 iff S <: Object.
///  - if T0 is S* for any S, then T0 <: T1 iff S <: T1
///  - if T0 is Null, dynamic, void, or S? for any S, then the subtyping does not
///      hold (per above, the result of the subtyping query is false).
///  - Otherwise T0 <: T1 is true.
/// @description Check that if T0 is a promoted type variable X & S and
/// S is not subtype of Object then T0 is not subtype of Object
/// @author sgrekhov@unipro.ru
/// @issue 42089
///
/// @description Check that if type T0 not a subtype of a type T1, then it cannot
/// be used as an argument of type T1. Global function required argument is
/// tested.
/// @author sgrekhov@unipro.ru
///
/// This test is generated from test_types/right_object_fail_A02.dart and 
/// test_cases/arguments_binding_fail_x01.dart. Don't modify it! 
/// If you need to change this test, then change one of the files above and then 
/// run generator/generator.dart to regenerate the tests.

class X {}
class S extends X {}

S? t0Instance = new S();
Object t1Instance = new Object();

const t1Default = const Object();

namedArgumentsFunc1(Object t1, {Object t2 = t1Default}) {}
positionalArgumentsFunc1(Object t1, [Object t2 = t1Default]) {}

class ArgumentsBindingClass {
    ArgumentsBindingClass(Object t1) {}

    ArgumentsBindingClass.named(Object t1, {Object t2 = t1Default}) {}
    ArgumentsBindingClass.positional(Object t1, [Object t2 = t1Default]) {}

    factory ArgumentsBindingClass.fNamed(Object t1, {Object t2 = t1Default}) {
        return new ArgumentsBindingClass.named(t1, t2: t2);
    }
    factory ArgumentsBindingClass.fPositional(Object t1, [Object t2 = t1Default]) {
        return new ArgumentsBindingClass.positional(t1, t2);
    }

    static namedArgumentsStaticMethod(Object t1, {Object t2 = t1Default}) {}
    static positionalArgumentsStaticMethod(Object t1, [Object t2 = t1Default]) {}

    namedArgumentsMethod(Object t1, {Object t2 = t1Default}) {}
    positionalArgumentsMethod(Object t1, [Object t2 = t1Default]) {}

    set testSetter(Object val) {}
}

class ArgumentsBindingClassSuper {
  ArgumentsBindingClassSuper(Object t1) {}
}

class ArgumentsBindingDesc extends ArgumentsBindingClassSuper {
  ArgumentsBindingDesc(S? t0) : super (t0) {}
//                                      ^^
// [analyzer] unspecified
// [cfe] unspecified
}

test<T>(T? t0Instance) {
  if (t0Instance is S?) {
    namedArgumentsFunc1(t0Instance);
//                      ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    namedArgumentsFunc1(t1Instance, t2: t0Instance);
//                                      ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    positionalArgumentsFunc1(t0Instance);
//                           ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    positionalArgumentsFunc1(t1Instance, t0Instance);
//                                       ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    new ArgumentsBindingClass(t0Instance);
//                            ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    new ArgumentsBindingClass(t1Instance).namedArgumentsMethod(t0Instance);
//                                                             ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    new ArgumentsBindingClass(t1Instance).namedArgumentsMethod(t1Instance, t2: t0Instance);
//                                                                             ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    new ArgumentsBindingClass(t1Instance).positionalArgumentsMethod(t0Instance);
//                                                                  ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    new ArgumentsBindingClass(t1Instance).positionalArgumentsMethod(t1Instance, t0Instance);
//                                                                              ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    new ArgumentsBindingClass(t1Instance).testSetter = t0Instance;
//                                                     ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    ArgumentsBindingClass.namedArgumentsStaticMethod(t0Instance);
//                                                   ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    ArgumentsBindingClass.namedArgumentsStaticMethod(t1Instance, t2: t0Instance);
//                                                                   ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    ArgumentsBindingClass.positionalArgumentsStaticMethod(t0Instance);
//                                                        ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    ArgumentsBindingClass.positionalArgumentsStaticMethod(t1Instance, t0Instance);
//                                                                    ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    new ArgumentsBindingClass.named(t0Instance);
//                                  ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    new ArgumentsBindingClass.named(t1Instance, t2: t0Instance);
//                                                  ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    new ArgumentsBindingClass.positional(t0Instance);
//                                       ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    new ArgumentsBindingClass.positional(t1Instance, t0Instance);
//                                                   ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    new ArgumentsBindingClass.fNamed(t0Instance);
//                                   ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    new ArgumentsBindingClass.fNamed(t1Instance, t2: t0Instance);
//                                                   ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    new ArgumentsBindingClass.fPositional(t0Instance);
//                                        ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    new ArgumentsBindingClass.fPositional(t1Instance, t0Instance);
//                                                    ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

main() {
  test<X>(t0Instance);
}
