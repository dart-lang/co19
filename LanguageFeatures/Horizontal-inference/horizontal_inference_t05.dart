// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Horizontal inference allows certain arguments of an invocation
/// (specifically function literals) to be type inferred in a context derived
/// from the type of other arguments.
///
/// @description Checks horizontal inference from empty lists and maps but with
/// type specified
/// @author sgrekhov22@gmail.com

import "../../Utils/expect.dart";

void f1<T>(void Function(T) a, List<T> b) {
  Expect.equals(typeOf<void Function(String)>(), a.runtimeType);
}
void f2<T, U>(void Function(T, U) a, Map<T, U> b) {
  Expect.equals(typeOf<void Function(int, String)>(), a.runtimeType);
}

main() {
  f1((t) {
    t.substring(0); // T == String
  }, <String>[]);
  f2((t, u) {
    t.isOdd;          // T== int
    u.substring(0);   // U == String
  }, <int, String>{});
}
