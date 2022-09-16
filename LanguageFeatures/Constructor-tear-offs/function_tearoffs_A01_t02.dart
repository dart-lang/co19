// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We will introduce syntax allowing you to explicitly instantiate a
/// function tear-off and a type literal for a generic class. The former for
/// consistency with constructor tear-offs, the latter to introduce in-line
/// types without needing a typedef, like we did for function types. And we do
/// both now because they share the same grammar productions.
///
/// Example:
///
///   T id<T>(T value) => value;
///   var idInt = id<int>; // Explicitly instantiated tear-off, saves on writing function types.
/// and
///   Type intList = List<int>; // In-line instantiated type literal.
///
/// @description Checks example from the Spec - tests negative cases.
/// @author iarkh@unipro.ru

import "../../Utils/expect.dart";

T id<T>(T value) => value;
var idInt = id<int>;

dynamic d1 = 3.14, d2 = [], d3 = "42";

main() {
  int i = idInt(4);
  Expect.equals(4, i);

  i = idInt(-1);
  Expect.equals(-1, i);

  i = idInt(0);
  Expect.equals(0, i);

  Expect.throws(() { idInt(d1); });
  Expect.throws(() { idInt(d2); });
  Expect.throws(() { idInt(d3); });
}
