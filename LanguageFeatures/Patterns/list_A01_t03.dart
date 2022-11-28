// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
/// listPattern         ::= typeArguments? '[' listPatternElements? ']'
/// listPatternElements ::= listPatternElement ( ',' listPatternElement )* ','?
/// listPatternElement  ::= pattern | restPattern
/// restPattern         ::= '...' pattern?
///
/// A list pattern matches an object that implements List and extracts elements
/// by position from it.
///
/// It is a compile-time error if:
///
/// typeArguments is present and has more than one type argument.
///
/// There is more than one restPattern element in the list pattern. It can
/// appear anywhere in the list, but there can only be zero or one.
///
/// @description Checks a list pattern with different subpatterns in a if-case
/// statement
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns,records

import "../../Utils/expect.dart";
import "patterns_lib.dart";

class C {
  const C();
}

String test(List list) {
  if (list case [1, > 0 || 42]) {
    return "logical-or";
  }
  if (list case [2, > 0 && < 10]) {
    return "logical-and";
  }
  if (list case [3, > 0]) {
    return "relational";
  }
  if (list case [4 as num, 42 as num]) {
    return "cast";
  }
  if (list case [5, var a?]) {
    return "null-check";
  }
  if (list case [6, final b!]) {
    return "null-assert";
  }
  if (list case [7, 42]) {
    return "constant-1";
  }
  if (list case [7, const C()]) {
    return "constant-2";
  }
  if (list case [8, String s]) {
    return "variable-1";
  }
  if (list case [8, var s2]) {
    return "variable-2";
  }
  if (list case [80, final String s3]) {
    return "variable-3";
  }
  if (list case [80, final s4]) {
    return "variable-4";
  }
  if (list case [9, (42)]) {
    return "parenthesized";
  }
  if (list case [10, [42, _]]) {
    return "list-1";
  }
  if (list case [10, <Object>["42", _]]) {
    return "list-2";
  }
  if (list case [11, {1: _}]) {
    return "map-1";
  }
  if (list case [11, <String, String>{"1": _}]) {
    return "map-2";
  }
  if (list case [12, (var x,)]) {
    return "record-1";
  }
  if (list case [12, (42, x: 0)]) {
    return "record-2";
  }
  if (list case [13, Square(size: 1)]) {
    return "object";
  } else {
    return "default";
  }
}

main() {
  Expect.equals("logical-or", [1, 1]);
  Expect.equals("logical-or", [1, 42]);
  Expect.equals("default", [1, 100]);
  Expect.equals("logical-and", [2, 1]);
  Expect.equals("default", [2, 10]);
  Expect.equals("relational", [3, 1]);
  Expect.equals("default", [3, 0]);
  Expect.equals("cast", <num>[4, 42]);
  Expect.equals("default", <int>[4, 42]);
  Expect.equals("null-check", <int?>[5, 42]);
  Expect.equals("default", <int?>[5, null]);
  Expect.equals("null-assert", <int?>[6, 42]);
  Expect.equals("constant-1", [7, 42]);
  Expect.equals("constant-2", [7, const C()]);
  Expect.equals("default", [7, "42"]);
  Expect.equals("variable-1", [8, "42"]);
  Expect.equals("variable-2", [8, 42]);
  Expect.equals("variable-3", [80, "42"]);
  Expect.equals("variable-4", [80, 42]);
  Expect.equals("parenthesized", [9, 42]);
  Expect.equals("default", [9, "42"]);
  Expect.equals("list-1", [10, [42, 42]]);
  Expect.equals("list-2", [10, ["42", 42]]);
  Expect.equals("default", [10, [Object(), 42]]);
  Expect.equals("map-1", [11, {1: 42}]);
  Expect.equals("map-2", [11, {"1": 42}]);
  Expect.equals("default", [11, {Object(): 42}]);
  Expect.equals("record-1", [12, (42,)]);
  Expect.equals("record-2", [12, (42, x: 0)]);
  Expect.equals("default", [12, (42, 0)]);
  Expect.equals("default", [12, (42, a: 0)]);
  Expect.equals("object", [13, Square(1)]);
  Expect.equals("default", [13, Square(2)]);
}
