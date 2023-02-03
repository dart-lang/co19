// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
/// To type check a pattern p being matched against a value of type M:
/// ...
/// Constant: Type check the pattern's value in context type M.
///
/// @description Check that the restriction that constants must be a subtype of
/// the matched value's static type is removed.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns

import "../../Utils/expect.dart";

class A {}
class B { const B(); }

String test1() {
  switch (A()) {
    case const B():
      return "match";
    default:
      return "no match";
  }
}

String test2() {
  if (A() case const B()) {
    return "match";
  }
  return "no match";
}

String test3() =>
  switch (A()) {
    const B() => "match",
    _ => "no match"
  };

main() {
  Expect.equals("no match", test1());
  Expect.equals("no match", test2());
  Expect.equals("no match", test3());
}
