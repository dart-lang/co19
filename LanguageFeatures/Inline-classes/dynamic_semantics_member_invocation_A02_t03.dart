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
/// Otherwise, if args is omitted and Dm is a method, the invocation evaluates
/// to a closurization of Dm where this and the name of the representation are
/// bound to o, and the type variables of V are bound to the actual values of
/// T1, .. Ts. The operator == of the closurization returns true if and only if
/// the operand is the same object.
///
/// @description Check that the operator `==`of the closurization returns true
/// if and only if the operand is the same object
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=inline-class

import "../../Utils/expect.dart";

inline class IC<T> {
  final T id;
  IC(this.id);

  T getId() => this.id;
}

inline class IC2<T extends num> {
  final T id;
  IC2(this.id);

  T plusOne() => this.id + 1 as T;
}

main() {
  IC ic1_1 = IC(42);
  var getIdTearOff = ic1_1.getId;
  Expect.notEquals(getIdTearOff, ic1_1.getId);
  Expect.equals(getIdTearOff, getIdTearOff);

  IC ic1_2 = IC(42);
  Expect.notEquals(ic1_2.getId, ic1_2.getId);
  Expect.notEquals(ic1_2.getId, ic1_1.getId);
  Expect.notEquals(getIdTearOff, ic1_1.getId);

  IC2 ic2_1 = IC2(42);
  Expect.notEquals(ic2_1.plusOne, ic2_1.plusOne);

  IC2 ic2_2 = IC2(3.14);
  Expect.notEquals(ic2_2.plusOne, ic2_2.plusOne);
  Expect.notEquals(ic2_1.plusOne, ic2_2.plusOne);
}
