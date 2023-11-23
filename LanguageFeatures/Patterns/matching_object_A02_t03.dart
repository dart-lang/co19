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
/// Object:
/// i. If the runtime type of v is not a subtype of the required type of p then
///   the match fails.
/// ii. Otherwise, for each field f in p, in source order:
///   a. Call the getter with the same name as f on v, and let the result be r.
///     The getter may be an in-scope extension member.
///   b. Match the subpattern of f against r. If the match fails, the object
///     match fails.
/// iii. The match succeeds if all field subpatterns match.
///
/// @description Checks that if match fails then the next getter in the source
/// order is not called
/// @author sgrekhov22@gmail.com

import "patterns_lib.dart";
import "../../Utils/expect.dart";

String log = "";

void logger(String s) {
  log += s;
}

const u1 = Unit(1, logger);

String test1(Object o) {
  switch (o) {
    case Square(area: u1, size: _):
      return "match";
    default:
      return "no match";
  }
}

String test2(Object o) {
  if (o case Square(size: u1, area: u1)) {
    return "match";
  }
  return "no match";
}

String test3(Object o) {
  return switch (o) {
      Square(area: u1, size: _) => "match",
      _ => "no match"
    };
}

void test4(dynamic o) {
  var Square(area: v1 as int, size: v2) = o;
}

main() {
  Square square = Square(2, logger);
  Expect.equals("no match", test1(square));
  Expect.equals("Square.area:(1==4);", log);
  log = "";
  Expect.equals("no match", test2(square));
  Expect.equals("Square.size:(1==2);", log);
  log = "";
  Expect.equals("no match", test3(square));
  Expect.equals("Square.area:(1==4);", log);
  log = "";
  Expect.throws(() {
    test4(square);
  });
  Expect.equals("Square.area:", log);
}
