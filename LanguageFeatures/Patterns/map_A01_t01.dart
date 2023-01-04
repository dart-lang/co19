// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
/// mapPattern        ::= typeArguments? '{' mapPatternEntries? '}'
/// mapPatternEntries ::= mapPatternEntry ( ',' mapPatternEntry )* ','?
/// mapPatternEntry   ::= expression ':' pattern | '...'
///
/// A map pattern matches values that implement Map and accesses values by key
/// from it.
///
/// It is a compile-time error if:
///
/// typeArguments is present and there are more or fewer than two type arguments
///
/// Any of the entry key expressions are not constant expressions.
///
/// If any two keys in the map are identical. Map patterns that don't have a
/// rest element only match if the length of the map is equal to the number of
/// map entries. If a map pattern has multiple identical key entries, they will
/// increase the required length for the pattern to match but in all but the
/// most perverse Map implementations will represent the same key. Thus, it's
/// very unlikely that any map pattern containing identical keys (and no rest
/// element) will ever match. Duplicate keys are most likely a typo in the code.
///
/// Any two record keys which both have primitive == are equal. Since records
/// don't have defined identity, we can't use the previous rule to detect
/// identical records. But records do support an equality test known at compile
/// time if all of their fields do, so we use that.
///
/// There is more than one ... element in the map pattern.
///
/// The ... element is not the last element in the map pattern.
///
/// @description Checks a map pattern with different subpatterns in a switch
/// expression
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns,records

import "../../Utils/expect.dart";
import "patterns_lib.dart";

class C {
  const C();
}

String test(Map map) {
  return switch (map) {
    <int, num>{1: > 0 || -42} => "logical-or",
    <int, num>{2: > 0 && < 10} => "logical-and",
    <int, num>{3: > 0} => "relational",
    {4: var x as num} => "cast",
    {5: var a?} => "null-check",
    {6: final b!} => "null-assert",
    {7: 42} => "constant-1",
    {7: const C()} => "constant-2",
    {8: String s1} => "variable-1",
    {8: var s2} => "variable-2",
    {80: final String s3} => "variable-3",
    {80: final s4} => "variable-4",
    {9: (42)} => "parenthesized",
    {10: [42, _]} => "list-1",
    {10: <Object>["42", _]} => "list-2",
    {11: {1: _}} => "map-1",
    {11: <String, String>{"1": _}} => "map-2",
    {12: (var x,)} => "record-1",
    {12: (42, x: 0)} => "record-2",
    {13: Square(size: Unit(1))} => "object",
    _ => "default"
  };
}

main() {
  Expect.equals("logical-or", test(<int, num>{1: 1}));
  Expect.equals("logical-or", test(<int, num>{1: -42}));
  Expect.equals("default", test(<int, num>{1: -100}));
  Expect.equals("logical-and", test(<int, num>{2: 1}));
  Expect.equals("default", test(<int, num>{2: 10}));
  Expect.equals("relational", test(<int, num>{3: 1}));
  Expect.equals("default", test(<int, num>{3: 0}));
  Expect.equals("cast", test({4: 42}));
  Expect.throws(() {test({4: "42"});});
  Expect.equals("null-check", test({5: 42}));
  Expect.equals("default", test({5: null}));
  Expect.equals("null-assert", test({6: 42}));
  Expect.throws(() {test({6: null});});
  Expect.equals("constant-1", test({7: 42}));
  Expect.equals("constant-2", test({7: const C()}));
  Expect.equals("default", test({7: "42"}));
  Expect.equals("variable-1", test({8: "42"}));
  Expect.equals("variable-2", test({8: 42}));
  Expect.equals("variable-3", test({80: "42"}));
  Expect.equals("variable-4", test({80: 42}));
  Expect.equals("parenthesized", test({9: 42}));
  Expect.equals("default", test({9: "42"}));
  Expect.equals("list-1", test({10: [42, 42]}));
  Expect.equals("list-2", test({10: <Object>["42", 42]}));
  Expect.equals("default", test({10: [Object(), 42]}));
  Expect.equals("map-1", test({11: {1: 42}}));
  Expect.equals("map-2", test({11: <String, String>{"1": "42"}}));
  Expect.equals("default", test({11: {Object(): 42}}));
  Expect.equals("record-1", test({12: (42,)}));
  Expect.equals("record-2", test({12: (42, x: 0)}));
  Expect.equals("default", test({12: (42, 0)}));
  Expect.equals("default", test({12: (42, a: 0)}));
  Expect.equals("object", test({13: Square(1)}));
  Expect.equals("default", test({13: Square(2)}));
}
