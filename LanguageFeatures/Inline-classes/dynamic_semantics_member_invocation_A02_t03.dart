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
/// @description Check that the operator `==` of the closurization returns true
/// if and only if the operand is the same object
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=inline-class

import "../../Utils/expect.dart";

inline class IC<T> {
  final T id;
  IC(this.id);

  Map<K, V> asMap<K, V extends T>(K key) => {key: this.id as V};
}

inline class IC2<T> implements IC<T>{
  final T id;
  IC2(this.id);
}

main() {
  IC<int> ic_1 = IC(42);
  var asMapTearOff_1 = ic_1.asMap;
  Expect.equals(asMapTearOff_1, asMapTearOff_1);

  IC<num> ic_2 = IC(42);
  var asMapTearOff_2 = ic_2.asMap;
  Expect.notEquals(asMapTearOff_2, asMapTearOff_1);
  Expect.equals(asMapTearOff_2, asMapTearOff_2);

  IC2<num> ic2 = IC2(42);
  var asMapTearOff2 = ic2.asMap;
  Expect.notEquals(asMapTearOff2, ic2.asMap);
  Expect.notEquals(asMapTearOff2, asMapTearOff_1);
  Expect.equals(asMapTearOff2, asMapTearOff2);
}
