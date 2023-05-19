// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Consider an invocation of the inline member m on the receiver e
/// according to the inline type V and with actual type arguments T1, ..., Ts.
/// If the invocation includes an actual argument part (possibly including some
/// actual type arguments) then call it args. Assume that V declares the type
/// variables X1, ..., Xs.
///
/// Let Dm be the declaration named m thath V has.
///
/// Evaluation of this invocation proceeds by evaluating e to an object o.
/// ...
/// Otherwise, the following is known: args is included, and Dm is a method. The
/// invocation proceeds to evaluate args to an actual argument list args1. Then
/// it executes the body of Dm in an environment where this and the name of the
/// representation are bound to o, the type variables of V are bound to the
/// actual values of T1, .. Ts, and the formal parameters of m are bound to
/// args1 in the same way that they would be bound for a normal function call.
/// If the body completes returning an object o2 then the invocation evaluates
/// to o2. If the body throws an object and a stack trace then the invocation
/// completes throwing the same object and stack trace.
///
/// @description Check that invocation of an inline class method in the case
/// when type arguments are specified.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=inline-class

import "../../Utils/expect.dart";

inline class IC<T> {
  final T id;
  IC(this.id);

  Map<K, V> asMap<K, V extends T>(K key) => {key: this.id as V};
}

main() {
  IC<num> ic1 = IC(42);
  Expect.mapEquals({"key1": 42}, ic1.asMap<String, int>("key1"));
  Expect.mapEquals({"key1": 42}, ic1.asMap<String, num>("key1"));
  Expect.throws(() {ic1.asMap<String, int>("key1").addAll({"key2": 3.14} as dynamic);});

  IC<int> ic2 = IC(0);
  Expect.mapEquals({"key1": 0}, ic2.asMap<String, int>("key1"));
  Expect.throws(() {ic2.asMap("key1").addAll(<String, num>{"key2": 1} as dynamic);});
}
