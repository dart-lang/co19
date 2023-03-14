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
/// @description Checks that if the runtime type of `v` is not a subtype of the
/// required type of `p` then the match fails and no getters of `v` are called
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns,records

import "patterns_lib.dart";
import "../../Utils/expect.dart";

String test1(Object o) {
  switch (o) {
    case Rectangle(area: var v):
      return "match-1";
    case Circle<Centimeter>(area: var v):
      return "match-2";
    case Shape<Meter>(area: var v):
      return "match-3";
    default:
      return "no match";
  }
}

String test2(Object o) {
  if (o case Rectangle(area: var v)) {
    return "match-1";
  }
  if (o case Circle<Centimeter>(area: var v)) {
    return "match-2";
  }
  if (o case Shape<Meter>(area: var v)) {
    return "match-3";
  }
  return "no match";
}

String test3(Object o) {
  return switch (o) {
      Rectangle() => "match-1",
      Circle<Centimeter>(area: _) => "match-2",
      Shape<Meter>() => "match-3",
      _ => "no match"
    };
}

void test4(dynamic o) {
  var Square<Meter>(area: v) = o;
}

String log = "";

void logger(String s) {
  log += s;
}

main() {
  Square square = Square(1, logger);
  Expect.equals("no match", test1(square));
  Expect.equals("", log);
  Expect.equals("no match", test2(square));
  Expect.equals("", log);
  Expect.equals("no match", test3(square));
  Expect.equals("", log);

  Expect.throws(() {
    test4(square);
  });
}
