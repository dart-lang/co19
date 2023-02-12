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
/// @description Check that in a matching context identifier pattern is type
/// checked in context type M
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns

import "../../Utils/expect.dart";

class A<X> {
  const A();
}

const a1 = A();
const a2 = A<int>();

String test1(A<num> v) {
  switch (v) {
    case a1:
      return "match-1";
    case a2:
      return "match-2";
    default:
      return "no match";
  }
}

String test2(A<num> v) {
  if (v case a1) {
    return "match-1";
  }
  if (v case a2) {
    return "match-2";
  }
  return "no match";
}

String test3(A<num> v) =>
  switch (v) {
    a1 => "match-1",
    a2 => "match-2",
    _ => "no match"
  };

main() {
  const A<num> v = A<int>();
  Expect.equals("match-2", test1(v));
  Expect.equals("match-2", test2(v));
  Expect.equals("match-2", test3(v));
}
