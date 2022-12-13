// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
/// recordPattern         ::= '(' patternFields? ')'
/// patternFields         ::= patternField ( ',' patternField )* ','?
/// patternField          ::= ( identifier? ':' )? pattern
///
/// A record pattern matches a record object and destructures its fields. If the
/// value isn't a record with the same shape as the pattern, then the match
/// fails. Otherwise, the field subpatterns are matched against the
/// corresponding fields in the record.
///
/// Field subpatterns can be in one of three forms:
///
/// A bare `pattern` destructures the corresponding positional field from the
/// record and matches it against pattern.
///
/// An `identifier: pattern` destructures the named field with the name
/// identifier and matches it against pattern.
///
/// A `: pattern` is a named field with the name omitted. When destructuring
/// named fields, it's very common to want to bind the resulting value to a
/// variable with the same name.
///
/// As a convenience, the identifier can be omitted and inferred from pattern.
/// The subpattern must be a variable pattern which may be wrapped in a unary
/// pattern. The field name is then inferred from the name in the variable
/// pattern.
///
/// @description Checks a bare record pattern with different subpatterns in a
/// if-case statement
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns,records

import "../../Utils/expect.dart";
import "patterns_lib.dart";

class C {
  const C();
}

String test(Record record) {
  if (record case (1, > 0 || -42)) {
    return "logical-or";
  }
  if (record case (2, > 0 && < 10)) {
    return "logical-and";
  }
  if (record case (3, > 0)) {
    return "relational";
  }
  if (record case (4, var c as num)) {
    return "cast = ${c.toStringAsFixed(2).replaceFirst(".00", "")}";
  }
  if (record case (5, var a?)) {
    return "null-check = $a";
  }
  if (record case (6, final b!)) {
    return "null-assert = $a";
  }
  if (record case (7, 42)) {
    return "constant-1";
  }
  if (record case (7, const C())) {
    return "constant-2";
  }
  if (record case (8, String s1)) {
    return "variable-1 = $s1";
  }
  if (record case (8, var s2)) {
    return "variable-2 = $s2";
  }
  if (record case (80, final String s3)) {
    return "variable-3 = $s3";
  }
  if (record case (80, final s4)) {
    return "variable-4 = $s4";
  }
  if (record case (9, (42))) {
    return "parenthesized";
  }
  if (record case (10, [42, _])) {
    return "list-1";
  }
  if (record case (10, <Object>["42", ...])) {
    return "list-2";
  }
  if (record case (11, {1: _})) {
    return "map-1";
  }
  if (record case (11, <String, String>{"1": _})) {
    return "map-2";
  }
  if (record case (12, (var x,))) {
    return "record-1 = $x";
  }
  if (record case (12, (42, x: 0))) {
    return "record-2";
  }
  if (record case (12, (42, x: final y))) {
    return "record-3 = $y";
  }
  if (record case (13, Square(size: 1))) {
    return "object-1";
  }
  if (record case (13, Square(size: var sz))) {
    return "object-2 = $sz";
  }
  return "default";
}

main() {
  Expect.equals("logical-or", test((1, 1)));
  Expect.equals("logical-or", test((1, -42)));
  Expect.equals("default", test((1, 100)));
  Expect.equals("logical-and", test((2, 1)));
  Expect.equals("default", test((2, 10)));
  Expect.equals("relational", test((3, 1)));
  Expect.equals("default", test((3, 0)));
  Expect.equals("cast = 42", test((4, 42)));
  Expect.equals("cast = 3.14", test((4, 3.14)));
  Expect.throws(() {test((4, "42"));});
  Expect.equals("null-check = 42", test((5, 42)));
  Expect.equals("default", test((5, null)));
  Expect.equals("null-assert = 42", test((6, 42)));
  Expect.throws(() {test((6, null));});
  Expect.equals("constant-1", test((7, 42)));
  Expect.equals("constant-2", test((7, const C())));
  Expect.equals("default", test((7, "42")));
  Expect.equals("variable-1 = 42", test((8, "42")));
  Expect.equals("variable-2 = 42", test((8, 42)));
  Expect.equals("variable-3 = 42", test((80, "42")));
  Expect.equals("variable-4 = 42", test((80, 42)));
  Expect.equals("parenthesized", test((9, 42)));
  Expect.equals("default", test((9, "42")));
  Expect.equals("list-1", test((10, [42, 42])));
  Expect.equals("list-2", test((10, ["42", 42, 0])));
  Expect.equals("default", test((10, [Object(), 42])));
  Expect.equals("map-1", test((11, {1: 42})));
  Expect.equals("map-2", test((11, {"1": 42})));
  Expect.equals("default", test((11, {Object(): 42})));
  Expect.equals("record-1 = 42", test((12, (42,))));
  Expect.equals("record-2", test((12, (42, x: 0))));
  Expect.equals("record-3 = 1", test((12, (42, x: 1))));
  Expect.equals("default", test((12, (42, 0))));
  Expect.equals("default", test((12, (42, a: 0))));
  Expect.equals("object-1", test((13, Square(1))));
  Expect.equals("object-2 = 2", test((13, Square(2))));
  Expect.equals("default", test((13, Square(2))));
}
