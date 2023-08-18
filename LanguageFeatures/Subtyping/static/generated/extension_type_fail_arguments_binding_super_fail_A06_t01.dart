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
/// @description Check that if type `T0` is an extension type `V` with a
/// non-nullable representation type then `Object` is not subtype of `V`
/// @author sgrekhov22@gmail.com
///
/// @description Check that if type T0 not a subtype of a type T1, then it cannot
/// be used as an argument of type T1. Test superclass members. Super constructor
/// required argument is tested.
/// @author sgrekhov@unipro.ru
/// @author ngl@unipro.ru
///
/// This test is generated from test_types/extension_type_fail_A06.dart and 
/// test_cases/arguments_binding_super_fail_x01.dart. Don't modify it! 
/// If you need to change this test, then change one of the files above and then 
/// run generator/generator.dart to regenerate the tests.

// SharedOptions=--enable-experiment=inline-class

extension type const V<T>(T id) {}

V<Object> t1Instance = V<Object>(42);
Object t0Instance = Object();

const t1Default = const V<Object>(Object());

class ArgumentsBindingSuper1_t02 {
  V<Object> m = t1Default;

  ArgumentsBindingSuper1_t02(V<Object> value): m = value {}
  ArgumentsBindingSuper1_t02.named(V<Object> value, {V<Object> val2 = t1Default}): m = value {}
  ArgumentsBindingSuper1_t02.positional(V<Object> value, [V<Object> val2 = t1Default]): m = value {}
  ArgumentsBindingSuper1_t02.short(this.m);

  void superTest(V<Object> val) {}
  void superTestPositioned(V<Object> val, [V<Object> val2 = t1Default]) {}
  void superTestNamed(V<Object> val, {V<Object> val2 = t1Default}) {}
  V<Object> get superGetter => t0Instance;
//                       ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  void set superSetter(V<Object> val) {}
}

class ArgumentsBinding1_t02 extends ArgumentsBindingSuper1_t02 {
  ArgumentsBinding1_t02(Object t0) : super(t0) {}
//                                      ^^
// [analyzer] unspecified
// [cfe] unspecified
  ArgumentsBinding1_t02.c1(Object t0) : super.named(t0) {}
//                                               ^^
// [analyzer] unspecified
// [cfe] unspecified
  ArgumentsBinding1_t02.c2(V<Object> t1, Object t2) : super.named(t1, val2: t2) {}
//                                                       ^^
// [analyzer] unspecified
// [cfe] unspecified
  ArgumentsBinding1_t02.c3(Object t0) : super.positional(t0) {}
//                                                    ^^
// [analyzer] unspecified
// [cfe] unspecified
  ArgumentsBinding1_t02.c4(V<Object> t1, Object t2) : super.positional(t1, t2) {}
//                                                                ^^
// [analyzer] unspecified
// [cfe] unspecified
  ArgumentsBinding1_t02.c5(Object t1) : super.short(t1) {}
//                                               ^^
// [analyzer] unspecified
// [cfe] unspecified

  ArgumentsBinding1_t02.valid() : super(t1Default) {}

  test() {
    superTest(t0Instance);
//            ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

    this.superTest(t0Instance);
//                 ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

    super.superTest(t0Instance);
//                  ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

    superTestPositioned(t0Instance);
//                      ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

    this.superTestPositioned(t0Instance);
//                           ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

    super.superTestPositioned(t0Instance);
//                            ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

    superTestPositioned(t1Instance, t0Instance);
//                                  ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

    this.superTestPositioned(t1Instance, t0Instance);
//                                       ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

    super.superTestPositioned(t1Instance, t0Instance);
//                                        ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

    superTestNamed(t0Instance);
//                 ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

    this.superTestNamed(t0Instance);
//                      ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

    super.superTestNamed(t0Instance);
//                       ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

    superTestNamed(t1Instance, val2: t0Instance);
//                                   ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

    this.superTestNamed(t1Instance, val2: t0Instance);
//                                        ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

    super.superTestNamed(t1Instance, val2: t0Instance);
//                                         ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

    superSetter = t0Instance;
//                ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

    this.superSetter = t0Instance;
//                     ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

    super.superSetter = t0Instance;
//                      ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

main() {
  new ArgumentsBinding1_t02.valid().superTest(t0Instance);
//                                            ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  new ArgumentsBinding1_t02.valid().superTestPositioned(t0Instance);
//                                                      ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  new ArgumentsBinding1_t02.valid().superTestPositioned(t1Instance, t0Instance);
//                                                                  ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  new ArgumentsBinding1_t02.valid().superTestNamed(t0Instance);
//                                                 ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  new ArgumentsBinding1_t02.valid().superTestNamed(t1Instance, val2: t0Instance);
//                                                                   ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  new ArgumentsBinding1_t02.valid().superSetter = t0Instance;
//                                                ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  new ArgumentsBinding1_t02.valid().test();
}
