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
/// @description Check that if a variable pattern has a type annotation, then
/// the required type of `p` is that type
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns

import "../../Utils/expect.dart";
import "../../Utils/static_type_helper.dart";

String test1(int x) {
  switch (x) {
    case num v:
      v.expectStaticType<Exactly<num>>();
      v = 3.14;
      return "match";
    default:
      return "no match";
  }
}

String test2(int x) {
  if (x case num v) {
    v.expectStaticType<Exactly<num>>();
    v = 3.14;
    return "match";
  }
  return "no match";
}

String test3(int x) =>
  switch (x) {
    num v when (v.expectStaticType<Exactly<num>>() is num) && ((v = 3.14) > 0)
        => "match",
    _ => "no match"
  };

main() {
  num v1 = 42;
  v1.expectStaticType<Exactly<num>>();
  v1 = 3.14;
  late final num v2;
  if (2 > 1) {
    v2 = 42;
  } else {
    v2 = 3.14;
  }
  v2.expectStaticType<Exactly<num>>();

  Expect.equals("match", test1(42));
  Expect.equals("match", test2(42));
  Expect.equals("match", test3(42));
}
