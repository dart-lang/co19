/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion We say that a type T0 is a subtype of a type T1 (written T0 <: T1)
 * when:
 * Right FutureOr: T1 is FutureOr<S1> and
 *   either T0 <: Future<S1>
 *   or T0 <: S1
 *   or T0 is X0 and X0 has bound S0 and S0 <: T1
 *   or T0 is X0 & S0 and S0 <: T1
 * @description Check that if a type T1 is FutureOr<S1> and a type T0 is a
 * subtype of a type S1, then a type T0 is a subtype of a type T1.
 * @author ngl@unipro.ru
 */
/**
 * @description Check that if type T0 is a subtype of a type T1, then instance
 * of T0 can be be used as an argument of type T1. Test mixin members
 * @author sgrekhov@unipro.ru
 */
/*
 * This test is generated from right_FutureOr_A02.dart and 
 * arguments_binding_x03.dart.
 * Don't modify it. If you want to change this file, change one of the files 
 * above and then run generator.dart to regenerate the tests.
 */


import '../../utils/common.dart';
// SharedOptions=--enable-experiment=non-nullable
import "dart:async";

class S1 {
  const S1();
}
class T0 extends S1 {}

T0 t0Instance = new T0();
FutureOr<S1> t1Instance = new Future.value(new S1());

const t1Default = const S1();




class ArgumentsBindingMixin1_t03 {
  FutureOr<S1> m = t1Default;

  void superTest(FutureOr<S1> val) {}
  void superTestPositioned(FutureOr<S1> val, [FutureOr<S1> val2 = t1Default]) {}
  void superTestNamed(FutureOr<S1> val, {FutureOr<S1> val2 = t1Default}) {}
  FutureOr<S1> get superGetter => m;
  void set superSetter(FutureOr<S1> val) {}
}

class ArgumentsBinding1_t03 extends Object with ArgumentsBindingMixin1_t03 {

  test(dynamic t1, dynamic t2) {
    superTest(t1);
    superTestPositioned(t1);
    superTestPositioned(t2, t1);
    superTestNamed(t1);
    superTestNamed(t2, val2: t1);
    superSetter = t1;
    m = t1;
    superGetter;
  }
}

class ArgumentsBindingMixin2_t03<X> {
  void superTest(X val) {}
  void superTestNamed(X val, {required X val2}) {}
  void set superSetter(X val) {}
}

class ArgumentsBinding2_t03<X> extends Object with ArgumentsBindingMixin2_t03<X> {

  test(dynamic t1, dynamic t2) {
    superTest(t1);
    superTestNamed(t2, val2: t1);
    superSetter = t1;
  }
}

main() {
  ArgumentsBinding1_t03 c1 = new ArgumentsBinding1_t03();

  c1.test(forgetType(t0Instance), t1Instance);
  c1.superTest(forgetType(t0Instance));
  c1.superTestPositioned(forgetType(t0Instance));
  c1.superTestPositioned(t1Instance, forgetType(t0Instance));
  c1.superTestNamed(forgetType(t0Instance));
  c1.superTestNamed(t1Instance, val2: forgetType(t0Instance));
  c1.superSetter = forgetType(t0Instance);
  c1.superGetter;

  // Test type parameters

  //# <-- NotGenericFunctionType
  ArgumentsBinding2_t03<FutureOr<S1>> c2 = new ArgumentsBinding2_t03<FutureOr<S1>>();
  c2.test(forgetType(t0Instance), t1Instance);
  c2.superTest(forgetType(t0Instance));
  c2.superTestNamed(t1Instance, val2: forgetType(t0Instance));
  c2.superSetter = forgetType(t0Instance);
  //# -->
}
