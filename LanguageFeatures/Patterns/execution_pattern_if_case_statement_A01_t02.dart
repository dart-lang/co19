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
/// @description Check that if pattern matches and there is a guard clause it is
/// executed. If guard is evaluated to `true` then the statement is executed. If
/// guard is evaluated to `false` then else statement is executed if any
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns,records

import "../../Utils/expect.dart";
import "patterns_lib.dart";

String log = "";

bool guard(bool v) {
  log += "guard($v);";
  return v;
}

void logger(String s) {
  log += s;
}

const unit4 = const Unit(4, logger);

main() {
  if (Square(2, logger) case Square(area: unit4) when guard(true)) {
    log += "statement;";
  }
  Expect.equals("Square.area:(4==4);guard(true);statement;", log);

  log = "";
  if (Square(2, logger) case Square(area: unit4) when guard(false)) {
    log += "statement;";
  }
  Expect.equals("Square.area:(4==4);guard(false);", log);

  log = "";
  if (Square(2, logger) case Square(area: unit4) when guard(false)) {
    log += "statement;";
  } else {
    log += "else;";
  }
  Expect.equals("Square.area:(4==4);guard(false);else;", log);
}
