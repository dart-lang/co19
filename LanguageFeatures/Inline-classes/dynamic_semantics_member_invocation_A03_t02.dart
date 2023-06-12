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
/// @description Check that `this` is bound to `o`
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=inline-class

import "../../Utils/expect.dart";

inline class IC<T> {
  final T id;
  IC(this.id);

  Object test1() => this;
  void test2() {
    Expect.identical(this, id);
  }
}

inline class IC2<T> implements IC<T> {
  final T id;
  IC2(this.id);
}

inline class IC3<T extends num> implements IC<num> {
  final T id;
  IC3(this.id);
}

main() {
  IC<num> ic = IC(1);
  Expect.identical(ic, ic.test1());
  ic.test2();

  IC2<num> ic2 = IC2(2);
  Expect.identical(ic2, ic2.test1());
  ic2.test2();

  IC3<int> ic3 = IC3(3);
  Expect.identical(ic3, ic3.test1());
  ic3.test2();
}
