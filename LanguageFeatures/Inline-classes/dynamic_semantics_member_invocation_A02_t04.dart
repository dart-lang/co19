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
/// @description Check that if the body throws an object and a stack trace then
/// the invocation completes throwing the same object and stack trace.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=inline-class

import "../../Utils/expect.dart";

StackTrace st = StackTrace.fromString("42");

inline class IC<T extends num> {
  final T id;
  IC(this.id);

  X testMe<X extends T>() {
    if (2 > 1) {
      Error.throwWithStackTrace("X is $X", st);
    }
    return id as X;
  }
}

inline class IC2 implements IC<num> {
  final int id;
  IC2(this.id);
}

main() {
  IC<num> ic_1 = IC(42);
  try {
    ic_1.testMe();
  } catch (e, _st) {
    Expect.equals("X is num", e);
    Expect.equals(st, _st);
  }

  IC<int> ic_2 = IC(42);
  try {
    ic_2.testMe();
  } catch (e, _st) {
    Expect.equals("X is int", e);
    Expect.equals(st, _st);
  }

  IC2 ic2 = IC2(42);
  try {
    ic2.testMe();
  } catch (e, _st) {
    Expect.equals("X is num", e);
    Expect.equals(st, _st);
  }
}
