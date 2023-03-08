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
/// traditional for loop. Test a list pattern
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns

import "../../Utils/expect.dart";

main() {
  String log = "";
  for (var [a, b] = [0, 1]; a <= 13; [a, b] = [b, a + b]) {
    log += "$a;";
  }
  Expect.equals("0;1;1;2;3;5;8;13;", log);
}
