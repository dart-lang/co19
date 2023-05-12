// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
/// To type check a pattern p being matched against a value of type M:
/// ...
/// Object:
///
/// i. Resolve the object name to a type X. It is a compile-time error if the
///   name does not refer to a type. Apply downwards inference from M to infer
///   type arguments for X if needed.
/// ii. For each field subpattern of p, with name n and subpattern f:
///   a. Look up the member with name n on X using normal property extraction
///     rules. Let G be the type of the resulting property.
///
///     Property extraction allows an object pattern to invoke a getter or
///     tear-off a method. When X is dynamic or Never then X has all properties
///     and their types are likewise dynamic or Never unless the property is
///     defined on Object, in which case it has its usual type.
///
///   b. Type check f using G as the matched value type to find its required
///     type.
/// iii. The required type of p is X.
///
/// @description Check each field subpattern of p is type checked. Test that
/// it is no compile-time error if type test fails in a refutable context
/// @author sgrekhov22@gmail.com

import "../../Utils/expect.dart";
import "patterns_lib.dart";

String test1(Shape shape) {
  switch (shape) {
    case Square(area: int v1):
      return "match-1";
    case Square(:final String areaAsNullable):
      return "match-2";
    default:
      return "no match";
  }
}

String test2(Shape shape) {
  if (shape case Square(area: int v1)) {
      return "match-1";
  }
  if (shape case Square(:final String areaAsNullable)) {
    return "match-2";
  }
  return "no match";
}

String test3(Shape shape) =>
  switch (shape) {
    Square(area: int v1) => "match-1",
    Square(:final String areaAsNullable) => "match-2",
    _ => "no match"
  };

main() {
  Expect.equals("no match", test1(Square(2)));
  Expect.equals("no match", test2(Square(2)));
  Expect.equals("no match", test3(Square(2)));
}
