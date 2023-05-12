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
    case Square(size: one) && Circle(size: one):
      return "match";
    default:
      return "no match";
  }
}

String test2(Shape shape) {
  log = "";
  if (shape case Square(size: one) && Circle(size: one)) {
    return "match";
  }
  return "no match";
}

String test3(Shape shape) {
  log = "";
  return switch (shape) {
    Square(size: one) && Circle(size: one) => "match",
    _ => "no match"
  };
}

main() {
  Expect.equals("no match", test1(Square(1, logger)));
  Expect.equals("Square.size:(1==1);", log);
  Expect.equals("no match", test1(Circle(1, logger)));
  Expect.equals("", log);

  Expect.equals("no match", test2(Square(1, logger)));
  Expect.equals("Square.size:(1==1);", log);
  Expect.equals("no match", test2(Circle(1, logger)));
  Expect.equals("", log);

  Expect.equals("no match", test3(Square(1, logger)));
  Expect.equals("Square.size:(1==1);", log);
  Expect.equals("no match", test3(Circle(1, logger)));
  Expect.equals("", log);
}
