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
/// @description Check that the operator `==` of the closurization returns true
/// if and only if the operand is the same object
/// @author sgrekhov22@gmail.com

import "../../Utils/expect.dart";

extension type ET1<T>(T id) {
  Map<K, V> asMap<K, V extends T>(K key) => {key: this.id as V};
}

extension type ET2<T>(T id) implements ET1<T> {}

main() {
  ET1<int> et1_1 = ET1(42);
  var asMapTearOff_1 = et1_1.asMap;
  Expect.equals(asMapTearOff_1, asMapTearOff_1);

  ET1<num> et1_2 = ET1(42);
  var asMapTearOff_2 = et1_2.asMap;
  Expect.notEquals(asMapTearOff_2, asMapTearOff_1);
  Expect.equals(asMapTearOff_2, asMapTearOff_2);

  ET2<num> et2 = ET2(42);
  var asMapTearOff2 = et2.asMap;
  Expect.notEquals(asMapTearOff2, asMapTearOff_1);
  Expect.equals(asMapTearOff2, asMapTearOff2);
}
