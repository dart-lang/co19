// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
/// To type check a pattern p being matched against a value of type M:
/// ...
/// Cast:
///
/// Resolve the type name to a type X. It is a compile-time error if the name
/// does not refer to a type.
///
/// Type-check the subpattern using X as the matched value type.
///
/// @description Check that if type-check of the subpattern using `X` as the
/// matched value type fails then, in a matching context, this pattern will
/// throw
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns

import "../../Utils/expect.dart";

String test1(Object x) {
  switch (x) {
    case final int z as String:
      return "String";
    default:
      return "default";
  }
}

String test2(Object x) {
  return switch (x) {
    final int z as String => "String",
    _ => "default"
  };
}

String test3(Object x) {
  if (x case final int z as String)
    return "String";
  return "default";
}

main() {
  Expect.equals("default", test1("s"));
  Expect.throws(() {test1(42);});
  Expect.equals("default", test2("s"));
  Expect.throws(() {test2(42);});
  Expect.equals("default", test3("s"));
  Expect.throws(() {test3(42);});
}
