// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Horizontal inference allows certain arguments of an invocation
/// (specifically function literals) to be type inferred in a context derived
/// from the type of other arguments.
///
/// @description Checks that type inferred from non-function types and return
/// types of the functions to function parameters types. Test optional named
/// parameters
/// @author sgrekhov22@gmail.com

import "../../Utils/expect.dart";

typedef expectedB = String Function();

void f<T, U>(void Function(T, U) a, {T Function()? b, U? c}) {
  Expect.equals(String, T);
  Expect.equals(int, U);
  Expect.equals(expectedB, b.runtimeType);
}

main() {
  f((t, u) {
    t.substring(0); // T == String
    u.isOdd;        // U == int
  }, b: () => "Lily was here", c: 42);
}
