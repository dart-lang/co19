// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Consider an invocation of the extension type member m on the
/// receiver expression e according to the extension type declaration V with
/// actual type arguments T1, ..., Ts. If the invocation includes an actual
/// argument part (possibly including some actual type arguments) then call it
/// args. If the invocation omits args, but includes a list of actual type
/// arguments then call them typeArgs. Assume that V declares the type variables
/// X1, ..., Xs
/// ...
/// Let Dm be the unique declaration named m that V has.
///
/// Evaluation of this invocation proceeds by evaluating e to an object o.
/// ...
/// Otherwise, if args is omitted and Dm is a method, the invocation evaluates
/// to a closurization of Dm where this and the name of the representation are
/// bound as with the getter invocation, and the type variables of V are bound
/// to the actual values of T1, .. Ts. The operator == of the closurization
/// returns true if and only if the operand is the same object.
///
/// @description Check that if the body throws an object and a stack trace then
/// the invocation completes throwing the same object and stack trace.
/// @author sgrekhov22@gmail.com

import "../../Utils/expect.dart";

StackTrace st = StackTrace.fromString("42");

extension type ET1<T extends num>(T id) {
  X testMe<X extends T>() {
    if (2 > 1) {
      Error.throwWithStackTrace("X is $X", st);
    }
    return id as X;
  }
}

extension type ET2(int id) implements ET1<num> {}

main() {
  ET1<num> et1_1 = ET1(42);
  try {
    et1_1.testMe();
  } catch (e, _st) {
    Expect.equals("X is ${num}", e);
    Expect.equals("$st", "$_st");
  }

  ET1<int> et1_2 = ET1(42);
  try {
    et1_2.testMe();
  } catch (e, _st) {
    Expect.equals("X is ${int}", e);
    Expect.equals("$st", "$_st");
  }

  ET2 et2 = ET2(42);
  try {
    et2.testMe();
  } catch (e, _st) {
    Expect.equals("X is ${num}", e);
    Expect.equals("$st", "$_st");
  }
}
