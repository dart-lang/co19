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
/// required type of `p` then the match fails
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns,records

import "../../Utils/expect.dart";

String test1(Object o) {
  switch (o) {
    case (_, int _):
      return "match-1";
    case (_, name: String _):
      return "match-2";
    case (value: int _, name: String _):
      return "match-3";
    default:
      return "no match";
  }
}

String test2(Object o) {
  if (o case (_, int _)) {
    return "match-1";
  }
  if (o case (_, name: String _)) {
    return "match-2";
  }
  if (o case (value: int _, name: String _)) {
    return "match-3";
  }
  return "no match";
}

String test3(Object o) {
  return switch (o) {
    (_, int _) => "match-1",
    (_, name: String _) => "match-2",
    (value: int _, name: String _) => "match-3",
    _ => "no match"
  };
}

void test4(dynamic o) {
  var (int v1, num _) = o;
}

main() {
  Expect.equals("no match", test1(()));
  Expect.equals("no match", test1((1,)));
  Expect.equals("no match", test1((1, "2")));
  Expect.equals("no match", test1((1, 2, name: "name")));
  Expect.equals("no match", test1((3.14, name: 3.14)));
  Expect.equals("no match", test1((value: "42", name: "answer")));
  Expect.equals("match-1", test1((1, 2)));
  Expect.equals("match-1", test1((1, 2) as (num, num)));
  Expect.equals("match-2", test1((3.14, name: "pi")));
  Expect.equals("match-2", test1((3.14, name: "pi") as (num, {Object name})));
  Expect.equals("match-3", test1((value: 42, name: "answer")));
  Expect.equals("match-3",
      test1((value: 42, name: "answer") as ({int value, Object name})));

  Expect.equals("no match", test2(()));
  Expect.equals("no match", test2((1,)));
  Expect.equals("no match", test2((1, "2")));
  Expect.equals("no match", test2((1, 2, name: "name")));
  Expect.equals("no match", test2((3.14, name: 3.14)));
  Expect.equals("no match", test2((value: "42", name: "answer")));
  Expect.equals("match-1", test2((1, 2)));
  Expect.equals("match-1", test2((1, 2) as (num, num)));
  Expect.equals("match-2", test2((3.14, name: "pi")));
  Expect.equals("match-2", test2((3.14, name: "pi") as (num, {Object name})));
  Expect.equals("match-3", test2((value: 42, name: "answer")));
  Expect.equals("match-3",
      test2((value: 42, name: "answer") as ({int value, Object name})));

  Expect.equals("no match", test3(()));
  Expect.equals("no match", test3((1,)));
  Expect.equals("no match", test3((1, "2")));
  Expect.equals("no match", test3((1, 2, name: "name")));
  Expect.equals("no match", test3((3.14, name: 3.14)));
  Expect.equals("no match", test3((value: "42", name: "answer")));
  Expect.equals("match-1", test3((1, 2)));
  Expect.equals("match-1", test3((1, 2) as (num, num)));
  Expect.equals("match-2", test3((3.14, name: "pi")));
  Expect.equals("match-2", test3((3.14, name: "pi") as (num, {Object name})));
  Expect.equals("match-3", test3((value: 42, name: "answer")));
  Expect.equals("match-3",
      test3((value: 42, name: "answer") as ({int value, Object name})));

  Expect.throws(() {
    test4(());
  });
  Expect.throws(() {
    test4((1,));
  });
  Expect.throws(() {
    test4((1, "2"));
  });
  Expect.throws(() {
    test4((1, 2, 3));
  });
  test4((1, 2));
  test4((1, 3.14));
}
