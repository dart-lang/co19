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
/// @description Checks that a non-empty case body implicitly jumps to the end
/// of the switch after completion
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns,records

import "../../Utils/expect.dart";
import "patterns_lib.dart";

String test(Object? o) {
  String toReturn = "";
  switch (o) {
    case 0 || -42:
      toReturn = "logical-or";
    case  == 1 && != 2:
      toReturn = "logical-and";
    case == 10:
      toReturn = "relational";
    case var c as Object when c == 11:
      toReturn = "cast";
    case var a? when a == 12:
      toReturn = "null-check";
    case final b! when b == 13:
      toReturn = "null-assert";
    case 14:
      toReturn = "constant";
    case var v when v == 15:
      toReturn = "variable";
    case (42):
      toReturn = "parenthesized";
    case [1, 2]:
      toReturn = "list";
    case {"key1": _}:
      toReturn = "map";
    case (42, x: 0):
      toReturn = "record";
    case Square(sizeAsInt: 1):
      toReturn = "object";
    case _:
      toReturn = "any";
    default:
      toReturn = "default";
  }
  return toReturn;
}

main() {
  Expect.equals("logical-or", test(0));
  Expect.equals("logical-and", test(1));
  Expect.equals("relational", test(10));
  Expect.equals("cast", test(11));
  Expect.equals("null-check", test(12));
  Expect.equals("null-assert", test(13));
  Expect.equals("constant", test(14));
  Expect.equals("variable", test(15));
  Expect.equals("parenthesized", test(42));
  Expect.equals("list", test([1, 2]));
  Expect.equals("map", test({"key1": 1}));
  Expect.equals("record", test((42, x: 0)));
  Expect.equals("object", test(Square(1)));
}
