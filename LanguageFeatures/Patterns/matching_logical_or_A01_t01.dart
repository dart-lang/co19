// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion At runtime, a pattern is matched against a value. This determines
/// whether or not the match fails and the pattern refutes the value. If the
/// match succeeds, the pattern may also destructure data from the object or
/// bind variables.
///
/// Refutable patterns usually occur in a context where match refutation causes
/// execution to skip over the body of code where any variables bound by the
/// pattern are in scope. If a pattern match failure occurs in an irrefutable
/// context, a runtime error is thrown.
///
/// To match a pattern p against a value v:
/// ...
/// Logical-or:
/// i. Match the left subpattern against v. If it matches, the logical-or match
///   succeeds.
/// ii. Otherwise, match the right subpattern against v and succeed if it
///   matches.
///
/// @description Check that if the left subpattern matches, then match succeeds.
/// Else the right subpattern is checked and logical-or pattern match succeeds
/// if it matches.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns,records

import "../../Utils/expect.dart";
import "patterns_lib.dart";

String log = "";
void logger(String s) {
  log += s;
}
const area1 = Unit(1, logger);
const area4 = Unit(4, logger);

String test1(Shape shape) {
  log = "";
  switch (shape) {
    case Square(area: area1) || Square(area: area4):
      return "match";
    default:
      return "no match";
  }
}

String test2(Shape shape) {
  log = "";
  if (shape case Square(area: area1) || Square(area: area4)) {
    return "match";
  }
  return "no match";
}

String test3(Shape shape) {
  log = "";
  return switch (shape) {
    Square(area: area1) || Square(area: area4) => "match",
    _ => "no match"
  };
}

main() {
  Expect.equals("match", test1(Square(1, logger)));
  Expect.equals("Square.area:(1==1);", log);
  Expect.equals("match", test1(Square(2, logger)));
  Expect.equals("Square.area:(1==4);:(4==4);", log);
  Expect.equals("no match", test1(Square(3, logger)));
  Expect.equals("Square.area:(1==9);:(4==9);", log);

  Expect.equals("match", test2(Square(1, logger)));
  Expect.equals("Square.area:(1==1);", log);
  Expect.equals("match", test2(Square(2, logger)));
  Expect.equals("Square.area:(1==4);:(4==4);", log);
  Expect.equals("no match", test2(Square(3, logger)));
  Expect.equals("Square.area:(1==9);:(4==9);", log);

  Expect.equals("match", test3(Square(1, logger)));
  Expect.equals("Square.area:(1==1);", log);
  Expect.equals("match", test3(Square(2, logger)));
  Expect.equals("Square.area:(1==4);:(4==4);", log);
  Expect.equals("no match", test3(Square(3, logger)));
  Expect.equals("Square.area:(1==9);:(4==9);", log);
}
