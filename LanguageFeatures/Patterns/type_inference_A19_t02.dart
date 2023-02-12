// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
/// To type check a pattern p being matched against a value of type M:
///
/// Logical-or and logical-and: Type check each branch using M as the matched
/// value type.
///
/// @description Check that if any branch of a logical-and pattern fails a
/// type check in refutable context then there is no error but match fails
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns

import "../../Utils/expect.dart";

String test1() {
  switch(<num>[]) {
    case List<num> v1 && List<int> v2:
      return "match";
    default:
      return "no match";
  }
}

String test2() {
  if (<num>[] case List<int> v1 && List<num> v2) {
    return "match";
  }
  return "no match";
}

String test3() => switch(<num>[]) {
    final List<num> v1 && List<int> v2 => "match",
    _ => "no match"
  };

main() {
  Expect.equals("no match", test1());
  Expect.equals("no match", test2());
  Expect.equals("no match", test3());
}
