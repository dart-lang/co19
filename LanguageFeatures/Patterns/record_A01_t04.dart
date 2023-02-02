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
/// @description Checks an `identifier: pattern` record pattern with different
/// subpatterns in a switch expression
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns,records

import "../../Utils/expect.dart";
import "patterns_lib.dart";

class C {
  const C();
}

String test(Record record) {
  return switch (record) {
    (n1: 0 || -42) => "logical-or",
    (n2: 0 && != 1) => "logical-and",
    (n3: != 0) => "relational",
    (n4: var c as num)
        => "cast = ${c.toStringAsFixed(2).replaceFirst(".00", "")}",
    (n5: var a?) => "null-check = $a",
    (n6: final b!) => "null-assert = $b",
    (n7: 42) => "constant-1",
    (n7: const C()) => "constant-2",
    (n8: String s1) => "variable-1 = $s1",
    (n8: var s2) => "variable-2 = $s2",
    (n80: final String s3) => "variable-3 = $s3",
    (n80: final s4) => "variable-4 = $s4",
    (n9: (42)) => "parenthesized",
    (n10: [42, _]) => "list-1",
    (n10: <Object>["42", ...]) => "list-2",
    (n11: {1: _}) => "map-1",
    (n11: <String, String>{"1": _}) => "map-2",
    (n12: (var x,)) => "record-1 = $x",
    (n12: (42, x: 0)) => "record-2",
    (n12: (42, x: final y)) => "record-3 = $y",
    (n13: Square(size: const Unit(1))) => "object-1",
    (n13: Square(size: var sz)) => "object-2 = $sz",
    _   => "default"
  };
}

main() {
  Expect.equals("logical-or", test((n1: 0)));
  Expect.equals("logical-or", test((n1: -42)));
  Expect.equals("default", test((n1: -100)));
  Expect.equals("logical-and", test((n2: 0)));
  Expect.equals("default", test((n2: 10)));
  Expect.equals("relational", test((n3: 1)));
  Expect.equals("default", test((n3: 0)));
  Expect.equals("cast = 42", test((n4: 42)));
  Expect.equals("cast = 3.14", test((n4: 3.14)));
  Expect.throws(() {test((n4: "42"));});
  Expect.equals("null-check = 42", test((n5: 42)));
  Expect.equals("default", test((n5: null)));
  Expect.equals("null-assert = 42", test((n6: 42)));
  Expect.throws(() {test((n6: null));});
  Expect.equals("constant-1", test((n7: 42)));
  Expect.equals("constant-2", test((n7: const C())));
  Expect.equals("default", test((n7: "42")));
  Expect.equals("variable-1 = 42", test((n8: "42")));
  Expect.equals("variable-2 = 42", test((n8: 42)));
  Expect.equals("variable-3 = 42", test((n80: "42")));
  Expect.equals("variable-4 = 42", test((n80: 42)));
  Expect.equals("parenthesized", test((n9: 42)));
  Expect.equals("default", test((n9: "42")));
  Expect.equals("list-1", test((n10: [42, 42])));
  Expect.equals("list-2", test((n10: ["42", 42, 0])));
  Expect.equals("default", test((n10: [Object(), 42])));
  Expect.equals("map-1", test((n11: {1: 42})));
  Expect.equals("map-2", test((n11: {"1": "42"})));
  Expect.equals("default", test((n11: {Object(): 42})));
  Expect.equals("record-1 = 42", test((n12: (42,))));
  Expect.equals("record-2", test((n12: (42, x: 0))));
  Expect.equals("record-3 = 1", test((n12: (42, x: 1))));
  Expect.equals("default", test((n12: (42, 0))));
  Expect.equals("default", test((n12: (42, a: 0))));
  Expect.equals("object-1", test((n13: Square(1))));
  Expect.equals("object-2 = 2", test((n13: Square(2))));
  Expect.equals("default", test((n13: Circle(2))));
}
