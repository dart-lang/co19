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
/// @description Check invocation of an extension type `call` member
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=inline-class

import "../../Utils/expect.dart";

class C {
  String call() => "call from C";
}

extension type ET1(C _) implements C {}

extension type ET2(int _) {
  String call() => "call from ET2";
}

main() {
  ET1 e1 = ET1(C());
  ET2 e2 = ET2(0);

  Expect.equals("call from C", e1());
  Expect.equals("call from ET2", e2());
  Expect.equals("call from C", e1.call());
  Expect.equals("call from ET2", e2.call());
  Expect.equals("call from C", (e1.call)());
  Expect.equals("call from ET2", (e2.call)());
}
