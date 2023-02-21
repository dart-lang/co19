// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
/// To type check a pattern p being matched against a value of type M:
/// ...
/// Identifier:
///
/// In an assignment context, the required type of p is the (unpromoted) static
/// type of the variable that p resolves to.
///
/// In a matching context, the name refers to a constant. Type check the
/// constant identifier expression in context type M.
///
/// In a declaration context, the required type of p is M, as is the static type
/// of the variable introduced by p.
///
/// @description Check that in a matching context, an identifier pattern is type
/// checked in context type `M`
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns

import "../../Utils/expect.dart";

X id<X>(X x) => x;
const int Function(int) intId = id;

String test1() {
  switch (intId) {
    case id:
      return "match";
    default:
      return "no match";
  }
}

String test2() {
  if (intId case id) {
    return "match";
  }
  return "no match";
}

String test3() =>
  switch (intId) {
    id => "match",
    _ => "no match"
  };

main() {
  Expect.equals("match", test1());
  Expect.equals("match", test2());
  Expect.equals("match", test3());
}
