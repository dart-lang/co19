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
/// for loop. Test an object pattern
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns,records

import "../../Utils/expect.dart";
import "patterns_lib.dart";

main() {
  var list = [
    0,
    for (var Square(:areaAsInt) = Square(1); areaAsInt <= 9;
        Square(:areaAsInt) = Square((++areaAsInt).toDouble())) areaAsInt,
    42
  ];
  Expect.listEquals([0, 1, 4, 42], list);
}
