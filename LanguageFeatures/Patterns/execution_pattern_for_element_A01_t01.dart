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
/// for loop. Test variable and identifier subpatterns of parenthesized pattern
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns

import "../../Utils/expect.dart";

main() {
  var list1 = [
    0,
    for (var (int i) = 1; i < 3; (i) += (i + 1)) i,
    4
  ];
  Expect.listEquals([0, 1, 2, 3, 4], list1);
  int j = -1;
  var list2 = [
    0,
    for ((j) = 1; i < 3; (j) += (j + 1)) l,
    4
  ];
  Expect.listEquals([0, 1, 2, 3, 4], list2);
}
