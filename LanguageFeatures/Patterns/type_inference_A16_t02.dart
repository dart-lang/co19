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
/// @description Check that if the variable pattern has a type annotation, the
/// required type of p is that type
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns

import "../../Utils/expect.dart";
import "../../Utils/static_type_helper.dart";

String test1(num x) {
  switch (x) {
    case final int v:
      v.expectStaticType<Exactly<int>>();
      return "match";
    default:
      return "no match";
  }
}

String test2(num x) {
  if (x case final int v) {
    v.expectStaticType<Exactly<int>>();
    return "match";
  }
  return "no match";
}

String test3(num x) =>
  switch (x) {
     final int v when v.expectStaticType<Exactly<int>>() is int => "match",
    _ => "no match"
  };

main() {
  Expect.equals("match", test1(42));
  Expect.equals("match", test2(42));
  Expect.equals("match", test3(42));
}
