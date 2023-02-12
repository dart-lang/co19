// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
/// To type check a pattern p being matched against a value of type M:
/// ...
/// Constant: Type check the pattern's value in context type M.
///
/// @description Check that type argument may be inferred from a context type
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns

import "../../Utils/expect.dart";

class A<X> {
  const A();
}

String test1(A<num> a) {
  switch (a) {
    case const A():
      return "match-1";
    case const A<int>():
      return "match-2";
    default:
      return "no match";
  }
}

String test2(A<num> a) {
  if (a case const A()) {
    return "match-1";
  }
  if (a case const A<int>()) {
    return "match-2";
  }
  return "no match";
}

String test3(A<num> a) =>
  switch (a) {
    const A() => "match-1",
    const A<int>() => "match-2",
    _ => "no match"
  };

main() {
  const A<num> a1 = A<num>();
  const A<num> a2 = A<int>();
  Expect.equals("match-1", test1(a1));
  Expect.equals("match-1", test2(a1));
  Expect.equals("match-1", test3(a1));
  Expect.equals("match-2", test1(a2));
  Expect.equals("match-2", test2(a2));
  Expect.equals("match-2", test3(a2));
}
