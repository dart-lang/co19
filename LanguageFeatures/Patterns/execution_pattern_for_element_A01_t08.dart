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
/// for loop. Test a map pattern in a map literal
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns

import "../../Utils/expect.dart";

main() {
  var map = {
    "k-1": -1,
    for (var {"k1": a, "k2": b} = {"k1": 0, "k2": 1};
        a <= 8;
        {"k1": a, "k2": b} = {"k1": b, "k2": a + b})
      "k$a": a,
    "k13": 13
  };
  Expect.mapEquals({
    "k-1": -1,
    "k0": 0,
    "k1": 1,
    "k2": 2,
    "k3": 3,
    "k5": 5,
    "k8": 8,
    "k13": 13
  }, map);
}
