// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
/// A simple identifier in any context named _ is treated as a wildcard variable
/// pattern.
///
/// @description Checks that a simple identifier in a matching context named _
/// is treated as a wildcard variable pattern.
/// @author sgrekhov22@gmail.com

import "../../Utils/expect.dart";
import "patterns_lib.dart";

const _ = 1;

String test1(int x) {
  switch (x) {
    case 1:
      return "match 1";
    case _:
      return "match";
    default:
      return "no match";
  }
}

String test2(int x) =>
  switch (x) {
    1 => "match 1",
    _ => "no match"
  };

String test3(int x) {
  if (x case 1) {
    return "match 1";
  }
  if (x case _) {
    return "match";
  }
  return "no match";
}

main() {
  Expect.equals("match", test1(2));
  Expect.equals("match 1", test1(1));
  Expect.equals("no match", test2(2));
  Expect.equals("match 1", test2(1));
  Expect.equals("match", test3(2));
  Expect.equals("match 1", test3(1));
}
