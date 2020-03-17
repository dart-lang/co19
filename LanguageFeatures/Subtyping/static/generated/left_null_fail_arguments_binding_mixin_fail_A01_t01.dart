/*
 * Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion We say that a type T0 is a subtype of a type T1 (written T0 <: T1)
 * when:
 * Left Null: if T0 is Null then:
 * - if T1 is a type variable (promoted or not) the query is false
 * - If T1 is FutureOr<S> for some S, then the query is true iff Null <: S.
 * - If T1 is Null, S? or S* for some S, then the query is true.
 * - Otherwise, the query is false
 * @description Check that if type T0 is Null and T1 is FutureOr<S> for some S,
 * and Null is not subtype of S then T0 is not subtype of T1.
 * @author sgrekhov@unipro.ru
 */
/**
 * @description Check that if type T0 not a subtype of a type T1, then it cannot
 * be used as an argument of type T1. Test mixin members. Super method required
 * argument is tested.
 * @compile-error
 * @author sgrekhov@unipro.ru
 * @author ngl@unipro.ru
 */
/*
 * This test is generated from left_null_fail_A01.dart and 
 * arguments_binding_mixin_fail_x01.dart.
 * Don't modify it. If you want to change this file, change one of the files 
 * above and then run generator.dart to regenerate the tests.
 */


// SharedOptions=--enable-experiment=non-nullable
import "dart:async";

Null t0Instance = null;
FutureOr<Object> t1Instance = new Object();

const t1Default = const Object();




class ArgumentsBindingSuper1_t03 {
  void superTest(FutureOr<Object> val) {}
  void superTestPositioned(FutureOr<Object> val, [FutureOr<Object> val2 = t1Default]) {}
  void superTestNamed(FutureOr<Object> val, {FutureOr<Object> val2 = t1Default}) {}
  FutureOr<Object> get superGetter => t0Instance;
//                       ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  void set superSetter(FutureOr<Object> val) {}
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
