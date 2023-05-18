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
/// @description Check that invocation of an inline class method in the case when
/// type arguments are specified.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=inline-class

import "../../Utils/expect.dart";

inline class IC1 {
  final int id;
  IC1(this.id);

  int foo<T1, T2 extends num>() => 42;
}

inline class IC2<T extends num> {
  final T id;
  IC2(this.id);

  T foo<T1, T2 extends T>() => this.id;
}

main() {
  IC1 ic1 = IC1(42);
  Expect.equals(42, ic1.foo<String, double>());

  IC2<num> ic2 = IC2<double>(3.14);
  Expect.equals(3.14, ic2.foo<String, double>());

  IC2<double> ic3 = IC2(3.14);
  Expect.equals(3.14, ic3.foo<String, double>());
}
