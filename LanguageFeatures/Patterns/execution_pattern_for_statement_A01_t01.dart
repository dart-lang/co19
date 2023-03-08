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
/// traditional for loop. Test variable and identifier subpatterns of a
/// parenthesized pattern
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns

import "../../Utils/expect.dart";

main() {
  String log = "";
  for (var (int i) = 0; i < 3; (i) = (i + 1)) {
    log += "$i;";
  }
  Expect.equals("0;1;2;", log);
  log = "";
  var j = -1;
  for ((j) = 0; j < 3; (j) = (j + 1)) {
    log += "$j;";
  }
  Expect.equals("0;1;2;", log);
}
