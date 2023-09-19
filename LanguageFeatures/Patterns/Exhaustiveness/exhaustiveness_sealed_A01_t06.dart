// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Switch statements and expressions with a sealed class as a
/// matched type are always exhaustive
///
/// @description Check that it is no compile-time error if the matched value
/// type of a switch expression is a sealed class and the set of cases is
/// exhaustive
/// @author sgrekhov22@gmail.com

import "../../../Utils/expect.dart";

sealed class S {}

mixin M on S {}

class C extends S {}

class F implements M {}

void main() {
  S s = F();
  int v1 = switch (s) { C _ => 1, M _ => 2 };
  Expect.equals(2, v1);

  s = C();
  if (1 > 2) {
    s = F(); // to remove 'dead code' hint below
  }
  int v2 = switch (s) { C _ => 1, M _ => 2 };
  Expect.equals(1, v2);
}
