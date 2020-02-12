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
 * subtype of a type Future<S1>, then a type T0 is a subtype of a type T1.
 * @author ngl@unipro.ru
 */
/**
 * @description Check that if type T0 is a subtype of a type T1, then instance
 * of T0 can be be used as an argument of type T1. Test superclass members
 * @author sgrekhov@unipro.ru
 */
/*
 * This test is generated from right_FutureOr_A01.dart and 
 * arguments_binding_x02.dart.
 * Don't modify it. If you want to change this file, change one of the files 
 * above and then run generator.dart to regenerate the tests.
 */


import '../../utils/common.dart';
// SharedOptions=--enable-experiment=non-nullable
import "dart:async";

class S1 {
  const S1();
}

bool testDef(Object error) => true;
void onErrorDef() {}
FutureOr<S1> onTimeoutDef() => new S1();

class T0 implements Future<S1> {
  asStream() => getStream<S1>();
  catchError(Function onError, {bool test(Object error) = testDef}) => new Future.value();
  then<T0>(FutureOr<T0> onValue(S1 value), {Function onError = onErrorDef}) => new Future<T0>.value();
  timeout(Duration timeLimit, {FutureOr<S1> onTimeout() = onTimeoutDef}) => new Future.value();
  whenComplete(FutureOr action()) => new Future.value();
}

Stream<T> getStream<T>() {
  dynamic d = "";
  return d as Stream<T>;
}

T0 t0Instance = new T0();
FutureOr<S1> t1Instance = new Future.value(new S1());

const t1Default = const S1();




class ArgumentsBindingSuper1_t02 {
  FutureOr<S1> m;

  ArgumentsBindingSuper1_t02(FutureOr<S1> value): m = value {}
  ArgumentsBindingSuper1_t02.named(FutureOr<S1> value, {FutureOr<S1> val2 = t1Default}): m = value {}
  ArgumentsBindingSuper1_t02.positional(FutureOr<S1> value, [FutureOr<S1> val2 = t1Default]): m = value {}
  ArgumentsBindingSuper1_t02.short(this.m);

  void superTest(FutureOr<S1> val) {}
  void superTestPositioned(FutureOr<S1> val, [FutureOr<S1> val2 = t1Default]) {}
  void superTestNamed(FutureOr<S1> val, {FutureOr<S1> val2 = t1Default}) {}
  FutureOr<S1> get superGetter => m;
  void set superSetter(FutureOr<S1> val) {}
}

class ArgumentsBinding1_t02 extends ArgumentsBindingSuper1_t02 {
  ArgumentsBinding1_t02(dynamic t1) : super(t1) {}
  ArgumentsBinding1_t02.c2(dynamic t1, dynamic t2) : super.named(t1, val2: t2) {}
  ArgumentsBinding1_t02.c3(dynamic t1) : super.positional(t1) {}
  ArgumentsBinding1_t02.c4(dynamic t1, dynamic t2) : super.positional(t1, t2) {}
  ArgumentsBinding1_t02.c5(dynamic t1) : super.short(t1) {}

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

class ArgumentsBindingSuper2_t02<X> {
  X m;

  ArgumentsBindingSuper2_t02(X value): m = value {}
  ArgumentsBindingSuper2_t02.named(X value, {required X val2}):m = value {}
  ArgumentsBindingSuper2_t02.short(this.m);

  void superTest(X val) {}
  void superTestNamed(X val, {required X val2}) {}
  X get superGetter => m;
  void set superSetter(X val) {}
}

class ArgumentsBinding2_t02<X> extends ArgumentsBindingSuper2_t02<X> {
  ArgumentsBinding2_t02(X t1) : super(t1) {}
  ArgumentsBinding2_t02.c2(dynamic t1, dynamic t2) : super.named(t1, val2: t2) {}
  ArgumentsBinding2_t02.c5(dynamic t1) : super.short(t1) {}

  test(X t1, X t2) {
    superTest(t1);
    superTestNamed(t2, val2: t1);
    superSetter = t1;
    m = t1;
    superGetter;
  }
}

main() {
  ArgumentsBinding1_t02 c1 = new ArgumentsBinding1_t02(forgetType(t0Instance));
  c1 = new ArgumentsBinding1_t02.c2(t1Instance, forgetType(t0Instance));
  c1 = new ArgumentsBinding1_t02.c3(forgetType(t0Instance));
  c1 = new ArgumentsBinding1_t02.c4(t1Instance, forgetType(t0Instance));
  c1 = new ArgumentsBinding1_t02.c5(forgetType(t0Instance));

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
  ArgumentsBinding2_t02<FutureOr<S1>> c2 =
    new ArgumentsBinding2_t02<FutureOr<S1>>(forgetType(t0Instance));
  c2 = new ArgumentsBinding2_t02<FutureOr<S1>>.c2(t1Instance, forgetType(t0Instance));
  c2 = new ArgumentsBinding2_t02<FutureOr<S1>>.c5(forgetType(t0Instance));

  c2.test(forgetType(t0Instance), t1Instance);
  c2.superTest(forgetType(t0Instance));
  c2.superTestNamed(t1Instance, val2: forgetType(t0Instance));
  c2.superSetter = forgetType(t0Instance);
  c2.superGetter;
  //# -->
}
