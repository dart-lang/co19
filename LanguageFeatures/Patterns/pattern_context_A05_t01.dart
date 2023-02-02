// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
/// A simple identifier in a matching context is treated as a named constant
/// pattern unless its name is _
///
/// @description Checks that a simple identifier in a matching context is
/// treated as a named constant pattern
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns,records

import "../../Utils/expect.dart";
import "patterns_lib.dart";

const c = 1;

String test1(int x) {
  switch (x) {
    case c:
      return "match $c";
    default:
      return "no match";
  }
}

String test2(int x) =>
  switch (x) {
    c => "match $c",
    _ => "no match"
  };

String test3(int x) {
  if (x case c) {
    return "match $c";
  }
  return "no match";
}

main() {
  Expect.equals("no match", test1(2));
  Expect.equals("match 1", test1(1));
  Expect.equals("no match", test2(2));
  Expect.equals("match 1", test2(1));
  Expect.equals("no match", test3(2));
  Expect.equals("match 1", test3(1));
}
