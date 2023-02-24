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
/// Cast:
/// i. If the runtime type of v is not a subtype of the cast type of p then
///   throw a runtime error. Note that we throw even if this appears in a
///   matching context. The intent of this pattern is to assert that a value
///   must have some type.
/// ii. Otherwise, match the inner pattern against v.
///
/// @description Checks that a run-time error is thrown if runtime type of `v`
/// is not subtype of the cast type of `p`. Otherwise the inner pattern is
/// matched against `v`
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns

import "../../Utils/expect.dart";

String test1(Object o) {
  switch (o) {
    case <num>[var v] as List<int>:
      return "match";
    default:
      return "no match";
  }
}

String test2(Object o) {
  if (o case <num>[var v] as List<int>) {
    return "match";
  }
  return "no match";
}

String test3(Object o) =>
  switch (o) {
    <num>[var v] as List<int> => "match",
    _ => "no match"
  };

main() {
  Expect.throws(() {
    var (<num>[v] as List<int>) = [3.14];
  });
  var (<num>[v] as List<int>) = [42];
  Expect.equals(42, v);

  Expect.throws(() {
    test1([3.14]);
  });
  Expect.equals("match", test1([42]));
  Expect.throws(() {
    test2([3.14]);
  });
  Expect.equals("match", test2([42]));
  Expect.throws(() {
    test3([3.14]);
  });
  Expect.equals("match", test3([42]));
}
