// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion If-case element
/// 1. Evaluate the expression producing v.
/// 2. Match the pattern in the guardedPattern against v.
/// 3. If the match succeeds:
///   i. If there is a guard clause:
///     a. Evaluate it. If it does not evaluate to a bool, throw a runtime error
///     b. If the guard evaluates to true, evaluate the then element and yield
///       the result into the collection.
///     c. Else, evaluate the else element if there is one and yield the result
///       into the collection.
///   ii. Else there is no guard clause. Evaluate the then element and yield the
///     result into the collection.
/// 4. Else the match failed. Evaluate the else element if there is one and
///   yield the result into the collection.
///
/// @description Check that if a pattern matches and there is no guard clause
/// then the statement is executed.
/// @author sgrekhov22@gmail.com

import "../../Utils/expect.dart";
import "patterns_lib.dart";

String log = "";

void logger(String s) {
  log += s;
}

main() {
  var l = [
    0,
    if (Square(2, logger) case Square(area: const Unit(4, logger))) 1,
    2
  ];
  Expect.equals("Square.area:(4==4);", log);
  Expect.listEquals([0, 1, 2], l);
}
