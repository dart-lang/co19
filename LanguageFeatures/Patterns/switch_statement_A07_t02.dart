// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A long-running annoyance with switch statements is the mandatory
/// break statements at the end of each case body.
/// ...
/// This proposal removes the requirement that each non-empty case body
/// definitely exit. Instead, a non-empty case body implicitly jumps to the end
/// of the switch after completion.
/// ...
/// Empty cases continue to fallthrough to the next case as before.
///
/// @description Checks that an empty cases continue to fallthrough to the next
/// case as before.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns,records

import "../../Utils/expect.dart";
import "patterns_lib.dart";

String test(Object? o) {
  String toReturn = "";
  switch (o) {
    case 0 || -42:
    case  == 1 && != 2:
    case == 10:
    case var c as num when c == 11:
    case var a? when a == 12:
    case final b! when b == 13:
    case 14:
    case var v when v == 15:
    case (42):
    case [1, 2]:
    case {"key1": _}:
    case (42, x: 0):
    case Square(sizeAsInt: 1):
      toReturn = "match";
    default:
      toReturn = "no match";
  }
  return toReturn;
}

main() {
  Expect.equals("match", test(0));
  Expect.equals("match", test(1));
  Expect.equals("match", test(10));
  Expect.equals("match", test(11));
  Expect.equals("match", test(12));
  Expect.equals("match", test(13));
  Expect.equals("match", test(14));
  Expect.equals("match", test(15));
  Expect.equals("match", test(42));
  Expect.equals("match", test([1, 2]));
  Expect.equals("match", test({"key1": 1}));
  Expect.equals("match", test((42, x: 0)));
  Expect.equals("match", test(Square(1)));
}
