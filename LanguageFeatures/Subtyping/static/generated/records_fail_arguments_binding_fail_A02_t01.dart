// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We say that a type T0 is a subtype of a type T1 (written
/// T0 <: T1) when:
/// A record type A is a subtype of record type B iff they have same shape and
/// the types of all fields of A are subtypes of the corresponding field types
/// of B
///
/// @description Check that if type T0 is a record with another shape than T1
/// then T0 is not a subtype of T1
/// @author sgrekhov22@gmail.com
///
/// @description Check that if type T0 not a subtype of a type T1, then it cannot
/// be used as an argument of type T1. Global function required argument is
/// tested.
/// @author sgrekhov@unipro.ru
///
/// This test is generated from test_types/records_fail_A02.dart and 
/// test_cases/arguments_binding_fail_x01.dart. Don't modify it! 
/// If you need to change this test, then change one of the files above and then 
/// run generator/generator.dart to regenerate the tests.

(int, String) t0Instance = (1, "2");
(int, String, bool) t1Instance = (3, "4", false);

const t1Default = const (5, "6", false);

namedArgumentsFunc1((int, String, bool) t1, {(int, String, bool) t2 = t1Default}) {}
positionalArgumentsFunc1((int, String, bool) t1, [(int, String, bool) t2 = t1Default]) {}

class ArgumentsBindingClass {
    ArgumentsBindingClass((int, String, bool) t1) {}

    ArgumentsBindingClass.named((int, String, bool) t1, {(int, String, bool) t2 = t1Default}) {}
    ArgumentsBindingClass.positional((int, String, bool) t1, [(int, String, bool) t2 = t1Default]) {}

    factory ArgumentsBindingClass.fNamed((int, String, bool) t1, {(int, String, bool) t2 = t1Default}) {
        return new ArgumentsBindingClass.named(t1, t2: t2);
    }
    factory ArgumentsBindingClass.fPositional((int, String, bool) t1, [(int, String, bool) t2 = t1Default]) {
        return new ArgumentsBindingClass.positional(t1, t2);
    }

    static namedArgumentsStaticMethod((int, String, bool) t1, {(int, String, bool) t2 = t1Default}) {}
    static positionalArgumentsStaticMethod((int, String, bool) t1, [(int, String, bool) t2 = t1Default]) {}

    namedArgumentsMethod((int, String, bool) t1, {(int, String, bool) t2 = t1Default}) {}
    positionalArgumentsMethod((int, String, bool) t1, [(int, String, bool) t2 = t1Default]) {}

    set testSetter((int, String, bool) val) {}
}

class ArgumentsBindingClassSuper {
  ArgumentsBindingClassSuper((int, String, bool) t1) {}
}

class ArgumentsBindingDesc extends ArgumentsBindingClassSuper {
  ArgumentsBindingDesc((int, String) t0) : super (t0) {}
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
