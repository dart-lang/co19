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
/// @description Check that in case of invocation of an inline class method with
/// the omitted type argument the actual type variables of V are bound to the
/// actual values of T1, .. Ts.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=inline-class

import "../../Utils/expect.dart";

inline class IC<T> {
  final T id;
  IC(this.id);

  Map<K, Type> asMap<K, V extends T>(K key1, K key2) => {key1: V, key2: T};
}

main() {
  IC<num> ic1_1 = IC(42);
  Expect.mapEquals({"key1": num, "key2": num}, ic1_1.asMap("key1", "key2"));
}
