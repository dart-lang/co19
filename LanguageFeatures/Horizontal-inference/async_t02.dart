// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Horizontal inference allows certain arguments of an invocation
/// (specifically function literals) to be type inferred in a context derived
/// from the type of other arguments.
///
/// @description Checks that type inferred from non-function types and return
/// types of the functions to function parameters types. Test async functions
/// @author sgrekhov22@gmail.com

import "../../Utils/expect.dart";

int callCounter = 0;

Future<int> f<T, U, V>(
    void Function(T, U) a, T Function(V) b, U Function(V) c) async {
  Expect.equals(Future<String>, T);
  Expect.equals(Future<int>, U);
  Expect.equals(typeOf<Future<String> Function(Object? o)>(), b.runtimeType);
  Expect.equals(typeOf<Future<int> Function(Object? o)>(), c.runtimeType);
  return callCounter++;
}

main() async {
  await f((t, u) async {
    Stream<String> ss = t.asStream(); // T == Future<String>
    int val = await u; // U == Future<int>
  }, (v) async {
    return "Lily was here";
  }, (v) async {
    return 42;
  });
  Expect.equals(1, callCounter);
}
