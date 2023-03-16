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
/// Record:
/// i. If the runtime type of v is not a subtype of the required type of p, then
///   the match fails.
/// ii. For each field f in p, in source order:
///   a. Access the corresponding field in record v as r.
///   b. Match the subpattern of f against r. If the match fails, the record
///     match fails.
/// iii. The match succeeds if all field subpatterns match.
///
/// @description Checks that if the runtime type of `v` is not a subtype of the
/// required type of `p` then the match fails and no subpatterns matching is
/// performed
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns,records

import "../../Utils/expect.dart";

class C {
  final int value;
  final void Function(String) logger;
  const C(this.value, this.logger);

  @override
  bool operator ==(Object other) {
    logger("$this==$other;");
    if (other is C) {
      return this.value == other.value;
    }
    return false;
  }

  @override
  String toString() => "C($value)";
}

String log = "";

void logger(String s) {
  log += s;
}

const c1 = C(1, logger);
const c2 = C(2, logger);
const c3 = C(3, logger);
const c4 = C(4, logger);

String test1(Object o) {
  switch (o) {
    case (C c1, C c2):
      return "match-1";
    case (C c1, name1: C c2, C c3, name2: C c4):
      return "match-2";
    default:
      return "no match";
  }
}

String test2(Object o) {
  if (o case (c1, c2)) {
    return "match-1";
  }
  if (o case (c1, name1: c2, c3, name2: c4)) {
    return "match-2";
  }
  return "no match";
}

String test3(Object o) {
  return switch (o) {
      (c1, c2) => "match-1",
      (c1, name1: c2, c3, name2: c4) => "match-2",
      _ => "no match"
    };
}

main() {
  Expect.equals("no match", test1((1, 2)));
  Expect.equals("", log);
  Expect.equals("no match", test1((1, 2, name1: 3, name2: 4)));
  Expect.equals("", log);

  Expect.equals("no match", test2((1, 2)));
  Expect.equals("", log);
  Expect.equals("no match", test2((1, 2, name1: 3, name2: 4)));
  Expect.equals("", log);

  Expect.equals("no match", test3((1, 2)));
  Expect.equals("", log);
  Expect.equals("no match", test3((1, 2, name1: 3, name2: 4)));
  Expect.equals("", log);
}
