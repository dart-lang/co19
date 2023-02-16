// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
/// To type check a pattern p being matched against a value of type M:
/// ...
/// Record:
/// i. For each field f with subpattern s of p:
///   a. If M is a record type with the same shape as p, then let F be that
///     field's type in M.
///   b. Else if M is dynamic, then let F be dynamic.
///   c. Else let F be Object?. The field subpattern will only be matched at
///     runtime if the value does turn out to be a record with the right shape
///     where the field is present, so it's safe to just assume the field exists
///     when type checking here.
///   d. Type-check s using F as the matched value type.
///
/// ii. The required type of p is a record type with the same shape as p and
///   Object? for all fields.
///
/// @description Check that each field of the record pattern is type checked.
/// Test that if `M` is `dynamic` then `F` is also `dynamic`. Test refutable
/// context
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns,records

import "../../Utils/expect.dart";

String test1(dynamic d) {
  switch (d) {
    case (var v1, name: final n1):
      Expect.throws(() {
        v1.whatever;  // no compile-time error, v1 and n1 are dynamic
        n1.whatever;
      });
      return "match";
    default:
      return "no match";
  }
}

String test2(dynamic d) {
  if (d case (final v1, name: var n1)) {
    Expect.throws(() {
      v1.whatever;
      n1.whatever;
    });
    return "match";
  }
  return "no match";
}

String test3(dynamic d) =>
  switch (d) {
    (var v1, name: final n1) when v1.whatever => "match",
    _ => "no match"
  };

String test4(dynamic d) =>
  switch (d) {
    (var v1, name: final n1) when n1.whatever => "match",
    _ => "no match"
  };

main() {
  Expect.equals("match", test1((3.14, name: "pi")));
  Expect.equals("match", test2((3.14, name: "pi")));
  Expect.throws(() {test3((3.14, name: "pi"));});
  Expect.throws(() {test4((3.14, name: "pi"));});
  Expect.equals("no match", test1((3.14,)));
  Expect.equals("no match", test2((3.14,)));
  Expect.equals("no match", test3((3.14,)));
  Expect.equals("no match", test1((name: "pi")));
  Expect.equals("no match", test2((name: "pi")));
  Expect.equals("no match", test3((name: "pi")));
}
