// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Switch statements and expressions with a sealed class as a
/// matched type are always exhaustive
///
/// @description Check that it is no compile-time error if the matched value
/// type of a switch expression or statement is a sealed class and the set of
/// cases is exhaustive
/// @author sgrekhov22@gmail.com

import "../../../Utils/expect.dart";

sealed class S {}

mixin M on S {}

class C extends S {}

class F implements M {}

int test(S s) {
  switch (s) {
    case C _: return 1;
    case M _: return 2;
  }
}

void main() {
  S s = F();
  int v1 = switch (s) { C _ => 1, M _ => 2 };
  Expect.equals(2, v1);
  int v2 = test(s);
  Expect.equals(2, v2);

  s = C();
  if (1 > 2) {
    s = F(); // to remove 'dead code' hint below
  }
  int v3 = switch (s) { C _ => 1, M _ => 2 };
  Expect.equals(1, v3);
  int v4 = test(s);
  Expect.equals(1, v4);
}
