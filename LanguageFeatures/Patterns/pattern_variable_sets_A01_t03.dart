// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
/// The pattern variable set for a pattern is:
///
/// Logical-or: The pattern variable set of either branch. It is a compile-time
/// error if the two branches do not have equal pattern variable sets. Two
/// pattern variable sets are equal if they have the same set of names and each
/// corresponding pair of variables have the same finality and their types are
/// structurally equivalent after NORM().
///
/// @description Check that it not an error if the two branches do have
/// different type and finality but declares no variable
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns,records

import "../../Utils/expect.dart";

String test11(Object x) {
  switch (x) {
    case var _ || final _:
      return "match";
    default:
      return "no match";
  }
}

String test12(Object x) {
  switch (x) {
    case int _ || String _:
      return "match";
    default:
      return "no match";
  }
}

String test13(Object x) {
  switch (x) {
    case final int _ || _:
      return "match";
    default:
      return "no match";
  }
}

String test21(Object x) {
  if (x case var _ || final _)
    return "match";
  return "no match";
}

String test22(Object x) {
  if (x case int _ || String _)
    return "match";
  return "no match";
}

String test23(Object x) {
  if (x case int _ || _)
    return "match";
  return "no match";
}

String test31(Object x) =>
  switch (x) {
    var _ || final _ => "match",
    _ => "no match"
  };

String test32(Object x) =>
  switch (x) {
    int _ || String _ => "match",
    _ => "no match"
  };

String test33(Object x) =>
  switch (x) {
    int _ || _ => "match",
    _ => "no match"
  };

main () {
  Expect.equals("match", test11(1));
  Expect.equals("match", test12(1));
  Expect.equals("match", test13(1));
  Expect.equals("match", test21(1));
  Expect.equals("match", test22(1));
  Expect.equals("match", test23(1));
  Expect.equals("match", test31(1));
  Expect.equals("match", test32(1));
  Expect.equals("match", test33(1));
}
