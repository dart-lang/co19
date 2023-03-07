// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion If-case statement
/// 1. Evaluate the expression producing v.
/// 2. Match the pattern in the guardedPattern against v.
/// 3. If the match succeeds:
///   i. If there is a guard clause:
///     a. Evaluate it. If it does not evaluate to a bool, throw a runtime error
///     b. If the guard evaluates to true, execute the then statement.
///     c. Else, execute the else statement if there is one.
///   ii. Else there is no guard clause. Execute the then statement.
/// 4. Else the match failed. Execute the else statement if there is one.
///
/// @description Check that if a pattern matches and there is no guard clause
/// then the statement is executed.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns,records

import "../../Utils/expect.dart";
import "patterns_lib.dart";

String log = "";

void logger(String s) {
  log += s;
}

main() {
  if (Square(2, logger) case Square(area: const Unit(4, logger))) {
    log += "statement;";
  }
  Expect.equals("Square.area:(4==4);statement;", log);
}
