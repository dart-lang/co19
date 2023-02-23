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
/// @description Check that if a logical-and pattern match failure occurs in an
/// irrefutable context, a runtime error is thrown
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns,records

import "../../Utils/expect.dart";
import "patterns_lib.dart";

String log = "";
void logger(String s) {
  log += s;
}

main() {
  Expect.throws(() {
    var (Circle(size: v1) && Square(area: v2)) = Circle(1, logger) as dynamic;
  });
  Expect.equals("Circle.size", log);

  log = "";
  Expect.throws(() {
    final (Circle(size: v1) && Square(area: v2)) = Square(1, logger) as dynamic;
  });
  Expect.equals("", log);
}
