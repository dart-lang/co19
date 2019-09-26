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
 * of T0 can be be assigned to the class member of type T1
 * @author sgrekhov@unipro.ru
 */
/*
 * This test is generated from right_FutureOr_A01.dart and 
 * class_member_x01.dart.
 * Don't modify it. If you want to change this file, change one of the files 
 * above and then run generator.dart to regenerate the tests.
 */


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




class ClassMember1_t01 {
  static FutureOr<S1> s = t0Instance;
  FutureOr<S1> m = t0Instance;
  FutureOr<S1> _p = t0Instance;

  ClassMember1_t01() {
    s = t0Instance;
    m = t0Instance;
    _p = t0Instance;
  }

  ClassMember1_t01.named(FutureOr<S1> value) {
    s = value;
    m = value;
    _p = value;
  }

  ClassMember1_t01.short(this.m, this._p);

  test() {
    s = t0Instance;
    m = t0Instance;
    _p = t0Instance;
  }

  set setter(FutureOr<S1> val) {
    _p = val;
  }

  FutureOr<S1> get getter => _p;

  static staticTest() {
    s = t0Instance;
  }

  static set staticSetter(FutureOr<S1> val) {
    s = val;
  }

  static FutureOr<S1> get staticGetter => t0Instance;
}

main() {
  ClassMember1_t01 c1 = new ClassMember1_t01();
  c1 = new ClassMember1_t01.short(t0Instance,
      t0Instance);
  c1 = new ClassMember1_t01.named(t0Instance);
  c1.m = t0Instance;
  c1.test();
  c1.setter = t0Instance;
  c1.getter;

  ClassMember1_t01.s = t0Instance;
  ClassMember1_t01.staticTest();
  ClassMember1_t01.staticSetter = t0Instance;
  ClassMember1_t01.staticGetter;
}
