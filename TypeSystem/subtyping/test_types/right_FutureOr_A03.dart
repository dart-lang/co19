// Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We say that a type T0 is a subtype of a type T1 (written T0 <: T1)
/// when:
/// Right FutureOr: T1 is FutureOr<S1> and
///   either T0 <: Future<S1>
///   or T0 <: S1
///   or T0 is X0 and X0 has bound S0 and S0 <: T1
///   or T0 is X0 & S0 and S0 <: T1
/// @description Check that if a type T1 is Future<S1> and a type T0 is X0 and X0
/// has bound S0 and S0 <: Future<S1>, then a type T0 is a subtype of a type T1.
/// @author ngl@unipro.ru

import "dart:async";

class S1 {
  const S1();
}

bool testDef(Object error) => true;
void onErrorDef() {}
FutureOr<S1> onTimeoutDef() => new S1();

class S0 implements Future<S1> {
  asStream() => getStream<S1>();
  catchError(Function onError, {bool test(Object error)? = testDef}) =>
      new Future.value();
  then<T0>(FutureOr<T0> onValue(S1 value), {Function? onError = onErrorDef}) =>
      new Future<T0>.value();
  timeout(Duration timeLimit, {FutureOr<S1> onTimeout()? = onTimeoutDef}) =>
      new Future.value();
  whenComplete(FutureOr action()) => new Future.value();
}

Stream<T> getStream<T>() {
  dynamic d = "";
  return d as Stream<T>;
}

class X0 extends S0 {}

X0 t0Instance = new X0();
FutureOr<S1> t1Instance = new Future.value(new S1());

const t1Default = const S1();

//# @T0 = X0
//# @T1 = FutureOr<S1>
