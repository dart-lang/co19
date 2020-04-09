/*
 * Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion We say that a type T0 is a subtype of a type T1 (written T0 <: T1)
 * when:
 * Right Legacy T1 is S1* then:
 * - T0 <: T1 iff T0 <: S1?
 * @description Check that if type T1 is S1* and T0 is not subtype of S1? then
 * T0 is not subtype of T1.
 * @author sgrekhov@unipro.ru
 */
/**
 * @description Check that if type T0 not a subtype of a type T1, then it cannot
 * be used as an argument of type T1. Global function required argument is
 * tested.
 * @compile-error
 * @author sgrekhov@unipro.ru
 */
/*
 * This test is generated from right_legacy_fail_A02.dart and 
 * arguments_binding_fail_x01.dart.
 * Don't modify it. If you want to change this file, change one of the files 
 * above and then run generator.dart to regenerate the tests.
 */


// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-weak
import "../../utils/legacy_lib.dart";

class C extends X {}

C t0Instance = new C();
Y t1Instance = new Y();

const t1Default = const Y();





namedArgumentsFunc1(Y t1, {Y t2 = t1Default}) {}
positionalArgumentsFunc1(Y t1, [Y t2 = t1Default]) {}

class ArgumentsBindingClass {
    ArgumentsBindingClass(Y t1) {}

    ArgumentsBindingClass.named(Y t1, {Y t2 = t1Default}) {}
    ArgumentsBindingClass.positional(Y t1, [Y t2 = t1Default]) {}

    factory ArgumentsBindingClass.fNamed(Y t1, {Y t2 = t1Default}) {
        return new ArgumentsBindingClass.named(t1, t2: t2);
    }
    factory ArgumentsBindingClass.fPositional(Y t1, [Y t2 = t1Default]) {
        return new ArgumentsBindingClass.positional(t1, t2);
    }

    static namedArgumentsStaticMethod(Y t1, {Y t2 = t1Default}) {}
    static positionalArgumentsStaticMethod(Y t1, [Y t2 = t1Default]) {}

    namedArgumentsMethod(Y t1, {Y t2 = t1Default}) {}
    positionalArgumentsMethod(Y t1, [Y t2 = t1Default]) {}

    set testSetter(Y val) {}
}

class ArgumentsBindingClassSuper {
  ArgumentsBindingClassSuper(Y t1) {}
}

class ArgumentsBindingDesc extends ArgumentsBindingClassSuper {
  ArgumentsBindingDesc(C t0) : super (t0) {}
//                                      ^^
// [analyzer] unspecified
// [cfe] unspecified
}



test<T extends X>(T t0Instance) {

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

main() {
  test<C>(t0Instance);
}
