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
/// Logical-and:
/// i. Match the left subpattern against v. If the match fails, the logical-and
///   match fails.
/// ii. Otherwise, match the right subpattern against v and succeed if it
///   matches.
///
/// @description Check that if the left subpattern match fails, then logical-and
/// pattern match fails. Else the right subpattern is checked and logical-and
/// pattern match succeeds if it matches.
/// @author sgrekhov22@gmail.com

import "../../Utils/expect.dart";
import "patterns_lib.dart";

String log = "";
void logger(String s) {
  log += s;
}
const one = Unit(1, logger);

String test1(Shape shape) {
  log = "";
  switch (shape) {
    case Square(size: one) && Square(area: one):
      return "match-1";
    case Circle(size: one) && Circle(area: one):
      return "match-2";
    default:
      return "no match";
  }
}

String test2(Shape shape) {
  log = "";
  if (shape case Square(size: one) && Square(area: one)) {
    return "match-1";
  }
  if (shape case Circle(size: one) && Circle(area: one)) {
    return "match-2";
  }
  return "no match";
}

String test3(Shape shape) {
  log = "";
  return switch (shape) {
    Square(size: one) && Square(area: one) => "match-1",
    Circle(size: one) && Circle(area: one) => "match-2",
    _ => "no match"
  };
}

main() {
  Expect.equals("match-1", test1(Square(1, logger)));
  Expect.equals("Square.size:(1==1);Square.area:(1==1);", log);
  Expect.equals("no match", test1(Circle(1, logger)));
  Expect.equals("Circle.size:(1==1);Circle.area:(1==3.14);", log);
  Expect.equals("no match", test1(Square(3, logger)));
  Expect.equals("Square.size:(1==3);", log);

  Expect.equals("match-1", test2(Square(1, logger)));
  Expect.equals("Square.size:(1==1);Square.area:(1==1);", log);
  Expect.equals("no match", test2(Circle(1, logger)));
  Expect.equals("Circle.size:(1==1);Circle.area:(1==3.14);", log);
  Expect.equals("no match", test2(Square(3, logger)));
  Expect.equals("Square.size:(1==3);", log);

  Expect.equals("match-1", test3(Square(1, logger)));
  Expect.equals("Square.size:(1==1);Square.area:(1==1);", log);
  Expect.equals("no match", test3(Circle(1, logger)));
  Expect.equals("Circle.size:(1==1);Circle.area:(1==3.14);", log);
  Expect.equals("no match", test3(Square(3, logger)));
  Expect.equals("Square.size:(1==3);", log);
}
