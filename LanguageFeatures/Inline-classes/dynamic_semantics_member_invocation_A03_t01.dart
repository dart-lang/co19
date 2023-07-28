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
/// Otherwise, the following is known: args is included, and Dm is a method. The
/// invocation proceeds to evaluate args to an actual argument list args1. Then
/// it executes the body of Dm in an environment where this and the name of the
/// representation are bound in the same way as in the getter invocation, the
/// type variables of V are bound to the actual values of T1, .. Ts, and the
/// formal parameters of m are bound to args1 in the same way that they would be
/// bound for a normal function call. If the body completes returning an object
/// o2 then the invocation evaluates to o2. If the body throws an object and a
/// stack trace then the invocation completes throwing the same object and stack
/// trace.
///
/// @description Check that in case of an invocation of an extension type method
/// `m` the specified type parameters and formal parameters of `m` are bound to
/// `args1` in the same way that they would be bound for a normal function call
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=inline-class

import "../../Utils/expect.dart";

extension type ET1<T>(T id) {
  Map<K, Type> asMap<K, V extends T>(K key1, K key2) => {key1: V, key2: T};
}

extension type ET2<T> implements ET1<T>(T id) {}

extension type ET3<T extends num> implements ET1<num>(T id) {}

main() {
  ET1<num> et1 = ET1(42);
  Expect.mapEquals(
      {"key1": int, "key2": num}, et1.asMap<String, int>("key1", "key2"));
  Expect.mapEquals(
      {"key1": num, "key2": num}, et1.asMap<String, num>("key1", "key2"));

  ET1<num> et2 = ET2(42);
  Expect.mapEquals(
      {"key1": int, "key2": num}, et2.asMap<String, int>("key1", "key2"));
  Expect.mapEquals(
      {"key1": num, "key2": num}, et2.asMap<String, num>("key1", "key2"));

  ET3<int> ic3 = ET3(42);
  Expect.mapEquals(
      {"key1": int, "key2": num}, et3.asMap<String, int>("key1", "key2"));
  Expect.mapEquals(
      {"key1": num, "key2": num}, et3.asMap<String, num>("key1", "key2"));
}
