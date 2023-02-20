// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
/// To type check a pattern p being matched against a value of type M:
/// ...
/// Variable:
///
/// If the variable has a type annotation, the required type of p is that type,
/// as is the static type of the variable introduced by p.
///
/// Else the required type of p is M, as is the static type of the variable
/// introduced by p
///
/// @description Check that if a variable pattern `p` has a type annotation,
/// then the required type of `p` is that type. Test that there is no
/// compile-time error in a refutable context if the matched value type is not
/// assignable to the type of the variable pattern
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns

import "../../Utils/expect.dart";

String test1() {
  switch (42) {
    case final num v:
      return "match";
    default:
      return "no match";
  }
}

String test2() {
  switch ("42") {
    case num v:
    return "match";
    default:
      return "no match";
  }
}

String test3() {
  if (3.14 case num v) {
    return "match";
  }
  return "no match";
}

String test4() {
  if ("3.14" case final num v) {
    return "match";
  }
  return "no match";
}

String test5() =>
  switch (42) {
    final num v => "match",
    _ => "no match"
  };

String test6() =>
  switch ("42") {
    num v => "match",
    _ => "no match"
  };

main() {
  Expect.equals("match", test1());
  Expect.equals("no match", test2());
  Expect.equals("match", test3());
  Expect.equals("no match", test4());
  Expect.equals("match", test5());
  Expect.equals("no match", test6());
}
