/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion We say that a type T0 is a subtype of a type T1 (written T0 <: T1)
 * when:
 * Right Object: if T1 is Object then:
 *  - if T0 is an unpromoted type variable with bound B then T0 <: T1 iff
 *      B <: Object
 *  - if T0 is a promoted type variable X & S then T0 <: T1 iff S <: Object
 *  - if T0 is FutureOr<S> for some S, then T0 <: T1 iff S <: Object.
 *  - if T0 is S* for any S, then T0 <: T1 iff S <: T1
 *  - if T0 is Null, dynamic, void, or S? for any S, then the subtyping does not
 *      hold (per above, the result of the subtyping query is false).
 *  - Otherwise T0 <: T1 is true.
 * @description Check that if T0 is FutureOr<S> for some S but S is not subtype
 * of Object then T0 is not subtype of T1
 * @author sgrekhov@unipro.ru
 */
/**
 * @description Check that if type T0 not a subtype of a type T1, then it cannot
 * be used as an argument of type T1. Test superclass members. Super constructor
 * required argument is tested.
 * @compile-error
 * @author sgrekhov@unipro.ru
 * @author ngl@unipro.ru
 */
/*
 * This test is generated from right_object_fail_A05.dart and 
 * arguments_binding_super_fail_x01.dart.
 * Don't modify it. If you want to change this file, change one of the files 
 * above and then run generator.dart to regenerate the tests.
 */


// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-weak
import "dart:async";
import "../../utils/legacy_lib.dart";

FutureOr<X?> t0Instance = new X();
Object t1Instance = new Object();

const t1Default = const Object();




class ArgumentsBindingSuper1_t02 {
  Object m;

  ArgumentsBindingSuper1_t02(Object value): m = value {}
  ArgumentsBindingSuper1_t02.named(Object value, {Object val2 = t1Default}): m = value {}
  ArgumentsBindingSuper1_t02.positional(Object value, [Object val2 = t1Default]): m = value {}
  ArgumentsBindingSuper1_t02.short(this.m);

  void superTest(Object val) {}
  void superTestPositioned(Object val, [Object val2 = t1Default]) {}
  void superTestNamed(Object val, {Object val2 = t1Default}) {}
  Object get superGetter => t0Instance;
//                       ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  void set superSetter(Object val) {}
}

class ArgumentsBinding1_t02 extends ArgumentsBindingSuper1_t02 {
  ArgumentsBinding1_t02(FutureOr<X?> t0) : super(t0) {}
//                                      ^^
// [analyzer] unspecified
// [cfe] unspecified
  ArgumentsBinding1_t02.c1(FutureOr<X?> t0) : super.named(t0) {}
//                                               ^^
// [analyzer] unspecified
// [cfe] unspecified
  ArgumentsBinding1_t02.c2(Object t1, FutureOr<X?> t2) : super.named(t1, val2: t2) {}
//                                                       ^^
// [analyzer] unspecified
// [cfe] unspecified
  ArgumentsBinding1_t02.c3(FutureOr<X?> t0) : super.positional(t0) {}
//                                                    ^^
// [analyzer] unspecified
// [cfe] unspecified
  ArgumentsBinding1_t02.c4(Object t1, FutureOr<X?> t2) : super.positional(t1, t2) {}
//                                                                ^^
// [analyzer] unspecified
// [cfe] unspecified
  ArgumentsBinding1_t02.c5(FutureOr<X?> t1) : super.short(t1) {}
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
