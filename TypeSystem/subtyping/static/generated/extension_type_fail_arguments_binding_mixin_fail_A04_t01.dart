// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We say that a type T0 is a subtype of a type T1 (written
/// T0 <: T1) when:
///
/// Here is an overview of the subtype relationships of an extension type V0
/// with instantiated representation type R and instantiated superinterface
/// types V1 .. Vk, as well as other typing relationships involving V0
/// ...
/// V0 is a proper subtype of each of V1 .. Vk
///
/// @description Check that a superinterface of an extension type is not a
/// subtype of it
/// @author sgrekhov22@gmail.com
///
/// @description Check that if type T0 not a subtype of a type T1, then it cannot
/// be used as an argument of type T1. Test mixin members. Super method required
/// argument is tested.
/// @author sgrekhov@unipro.ru
/// @author ngl@unipro.ru
///
/// This test is generated from test_types/extension_type_fail_A04.dart and
/// test_cases/arguments_binding_mixin_fail_x01.dart. Don't modify it!
/// If you need to change this test, then change one of the files above and then
/// run generator/generator.dart to regenerate the tests.

extension type const V0(int i) implements int {}

V0 t1Instance = V0(42);
int t0Instance = 0;

const t1Default = V0(1);

mixin ArgumentsBindingSuper1_t03 {
  void superTest(V0 val) {}
  void superTestPositioned(V0 val, [V0 val2 = t1Default]) {}
  void superTestNamed(V0 val, {V0 val2 = t1Default}) {}
  V0 get superGetter => t0Instance;
//                       ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  void set superSetter(V0 val) {}
}

class ArgumentsBinding1_t03 extends Object with ArgumentsBindingSuper1_t03 {

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
  new ArgumentsBinding1_t03().superTest(t0Instance);
//                                      ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  new ArgumentsBinding1_t03().superTestPositioned(t0Instance);
//                                                ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  new ArgumentsBinding1_t03().superTestPositioned(t1Instance, t0Instance);
//                                                            ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  new ArgumentsBinding1_t03().superTestNamed(t0Instance);
//                                           ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  new ArgumentsBinding1_t03().superTestNamed(t1Instance, val2: t0Instance);
//                                                             ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  new ArgumentsBinding1_t03().superSetter = t0Instance;
//                                          ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  new ArgumentsBinding1_t03().test();
}
