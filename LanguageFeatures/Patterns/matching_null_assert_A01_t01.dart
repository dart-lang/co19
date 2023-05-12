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
/// Null-assert:
/// i. If v is null then throw a runtime error. Note that we throw even if this
///   appears in a matching context. The intent of this pattern is to assert
///   that a value must not be null.
/// ii. Otherwise, match the inner pattern against v.
///
/// @description Checks that if `v` is `null` then a run-time error is thrown.
/// Otherwise the inner pattern matched against `v`
/// @author sgrekhov22@gmail.com

import "../../Utils/expect.dart";

String test1(Object? o) {
  switch (o) {
    case num v!:
      return "match";
    default:
      return "no match";
  }
}

String test2(Object? o) {
  if (o case num v!) {
    return "match";
  }
  return "no match";
}

String test3(Object? o) =>
  switch (o) {
    num v! => "match",
    _ => "no match"
  };

main() {
  Expect.throws(() {
    var (v1!) = null;
  });
  num? x = 2 > 1 ? 42 : null;
  var (v2!) = x;
  Expect.equals(42, v2);

  Expect.equals("match", test1(42));
  Expect.equals("no match", test1("42"));
  Expect.throws(() {
    test1(null);
  });
  Expect.equals("match", test2(42));
  Expect.equals("no match", test2("42"));
  Expect.throws(() {
    test2(null);
  });
  Expect.equals("match", test3(42));
  Expect.equals("no match", test3("42"));
  Expect.throws(() {
    test3(null);
  });
}
