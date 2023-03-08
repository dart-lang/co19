// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
/// A statement of the form:
///
/// for (<patternVariableDeclaration>; <condition>; <increment>) <statement>
///
/// Is executed like a traditional for loop though is more likely to declare
/// multiple variables.
///
/// @description Check that a pattern-for statement is executed like a
/// traditional for loop. Test an object pattern
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns,records

import "../../Utils/expect.dart";
import "patterns_lib.dart";

main() {
  String log = "";
  for (var Square(:areaAsInt) = Square(1); areaAsInt <= 25;
      Square(:areaAsInt) = Square((++areaAsInt).toDouble())) {
    log += "$areaAsInt;";
  }
  Expect.equals("1;4;25;", log);
}
