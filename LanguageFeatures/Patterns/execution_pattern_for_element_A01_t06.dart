// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
/// Likewise, a collection element of the form:
///
/// for (<patternVariableDeclaration>; <condition>; <increment>) <element>
/// Is executed like a traditional for loop though is more likely to declare
/// multiple variables
///
/// @description Check that a pattern-for element is executed like a traditional
/// for loop. Test variable and identifier subpatterns of a parenthesized
/// pattern. Test pattern-for element in a map literal
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns

import "../../Utils/expect.dart";

main() {
  var map1 = {
    "k0": 0,
    for (var (int i) = 1; i <= 3; (i) = (i + 1)) "k$i": i,
    "k4": 4
  };
  Expect.mapEquals({"k0": 0, "k1": 1, "k2": 2, "k3": 3, "k4": 4}, map1);
  int j = -1;
  var map2 = {"k0": 0, for ((j) = 1; j < 4; (j) = (j + 1)) "k$j": j, "k4": 4};
  Expect.mapEquals({"k0": 0, "k1": 1, "k2": 2, "k3": 3, "k4": 4}, map2);
}
