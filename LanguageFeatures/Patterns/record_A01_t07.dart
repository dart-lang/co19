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
/// @description Checks an `: pattern` record pattern with different wrapping
/// patterns in a switch expression
/// @author sgrekhov22@gmail.com

import "../../Utils/expect.dart";

class C {
  const C();
}

String test(Record record) {
  return switch (record) {
    (: var case1) => "case1 = $case1",
    (: final case2) => "case2 = $case2",
    (: final () case3) => "case3 = $case3",
    (: List<int> case4) => "case4 = $case4",
    (: var case5 as num) => "case5 = $case5",
    (: final case6 as num) => "case6 = $case6",
    (: final Record case7 as ()) => "case7 = $case7",
    (: List<num> case8 as List<int>) => "case8 = $case8",
    (: var case9?) => "case9 = $case9",
    (: final case10?) => "case10 = $case10",
    (: final () case11?) => "case11 = $case11",
    (: List<int> case12?) => "case12 = $case12",
    (: var case13!) => "case13 = $case13",
    (: final case14!) => "case14 = $case14",
    (: final () case15!) => "case15 = $case15",
    (: List<int> case16!) => "case16 = $case16",
    (: (var case17)) => "case17 = $case17",
    (: (final case18)) => "case18 = $case18",
    (: (final () case19)) => "case19 = $case19",
    (: (List<int> case20)) => "case20 = $case20",
    _ => "default"
  };
}

main() {
  Expect.equals("case1 = 1", test((case1: 1)));
  Expect.equals("case2 = -42", test((case2: -42)));
  Expect.equals("case3 = ${().toString()}", test((case3: ())));
  Expect.equals("case4 = ${[1, 2, 3].toString()}", test((case4: [1, 2, 3])));
  Expect.equals("case5 = 1", test((case5: 1)));
  Expect.equals("case6 = -42", test((case6: -42)));
  Expect.equals("case7 = ${().toString()}", test((case7: ())));
  Expect.equals("case8 = ${[1, 2, 3].toString()}", test((case8: [1, 2, 3])));
  Expect.equals("case9 = 1", test((case9: 1)));
  Expect.equals("case10 = -42", test((case10: -42)));
  Expect.equals("case11 = ${().toString()}", test((case11: ())));
  Expect.equals("case12 = ${[1, 2, 3].toString()}", test((case12: [1, 2, 3])));
  Expect.equals("case13 = 1", test((case13: 1)));
  Expect.equals("case14 = -42", test((case14: -42)));
  Expect.equals("case15 = ${().toString()}", test((case15: ())));
  Expect.equals("case16 = ${[1, 2, 3].toString()}", test((case16: [1, 2, 3])));
  Expect.equals("case17 = 1", test((case17: 1)));
  Expect.equals("case18 = -42", test((case18: -42)));
  Expect.equals("case19 = ${().toString()}", test((case19: ())));
  Expect.equals("case20 = ${[1, 2, 3].toString()}", test((case20: [1, 2, 3])));

  Expect.equals("default", test((case0: 1)));
  Expect.equals("default", test((case1: 1, 42)));
  Expect.equals("default", test((case2: -42, 1)));
  Expect.equals("default", test((case3: (1,))));
  Expect.equals("default", test((case4: <String>[])));
  Expect.throws(() {test((case5: "42"));});
  Expect.throws(() {test((case6: "42"));});
  Expect.throws(() {test((case7: (42,)));});
  Expect.throws(() {test((case8: [3.14]));} );
  Expect.equals("default", test((case9: null)));
  Expect.equals("default", test((case10: null)));
  Expect.equals("default", test((case11: null)));
  Expect.equals("default", test((case12: null)));
  Expect.throws(() {test((case13: null));});
  Expect.throws(() {test((case14: null));});
  Expect.throws(() {test((case15: null));});
  Expect.throws(() {test((case16: null));});
  Expect.equals("default", test((case17: 1, 42)));
  Expect.equals("default", test((case18: -42, 1)));
  Expect.equals("default", test((case19: (1,))));
  Expect.equals("default", test((case20: <String>[])));
}
