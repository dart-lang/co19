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
/// @description Check that pattern-for element is executed like a traditional
/// for loop. Test record pattern
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns,records

import "../../Utils/expect.dart";

main() {
  var list = [
    -1,
    for (var (a, b) = (0, 1); a <= 8; (a, b) = (b, a + b)) a,
    13
  ];
  Expect.listEquals([-1, 0, 1, 1, 2, 3, 5, 8, 13], list);
}
