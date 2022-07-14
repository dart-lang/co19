// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Horizontal inference allows certain arguments of an invocation
/// (specifically function literals) to be type inferred in a context derived
/// from the type of other arguments.
///
/// @description Checks that type inferred from non-function types and return
/// types of the functions to function parameters types. Test async* functions
/// @author sgrekhov22@gmail.com

import "../../Utils/expect.dart";

typedef expectedB = Future<String> Function(Object? o);
typedef expectedC = Future<int> Function(Object? o);

Stream<int> f<T, U, V>(void Function(T, U) a, T Function(V) b,
    U Function(V) c) async* {
  Expect.equals(Future<String>, T);
  Expect.equals(Future<int>, U);
  Expect.equals(expectedB, b.runtimeType);
  Expect.equals(expectedC, c.runtimeType);
  yield 0;
}

main() async {
  await f((t, u) async* {
      String s = await t.first; // T == Stream<String>
      int val = await u.first;  // U == Stream<int>
      yield "";
    }, (v) async* {
      yield "Lily was here";
  }, (v) async* {
    yield 42;
  });
}
