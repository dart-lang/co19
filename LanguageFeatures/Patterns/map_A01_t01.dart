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
/// If any two keys in the map both have primitive == methods, then it is a
/// compile-time error if they are equal according to their == operator. In
/// cases where keys have types whose equality can be checked at compile time,
/// we report errors if there are redundant keys. But we don't require the keys
/// to have primitive equality for flexibility. In map patterns where the keys
/// don't have primitive equality, it is possible to have redundant keys and the
/// compiler won't detect it.
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
    case {1: > 0 || -42} => "logical-or";
    case {2: > 0 && < 10} => "logical-and";
    case {3: > 0} => "relational";
    case {4: var x as num} => "cast";
    case {5: var a?} => "null-check";
    case {6: final b!} => "null-assert";
    case {7: 42} => "constant-1";
    case {7: const C()} => "constant-2";
    case {8: String s1} => "variable-1";
    case {8: var s2} => "variable-2";
    case {80: final String s3} => "variable-3";
    case {80: final s4} => "variable-4";
    case {9: (42)} => "parenthesized";
    case {10: [42, _]} => "list-1";
    case {10: <Object>["42", _]} => "list-2";
    case {11: {1: _}} => "map-1";
    case {11: <String, String>{"1": _}} => "map-2";
    case {12: (var x,)} => "record-1";
    case {12: (42, x: 0)} => "record-2";
    case {13: Square(size: 1)} => "object";
    default => "default";
  };
}

main() {
  Expect.equals("logical-or", test({1: 1}));
  Expect.equals("logical-or", test({1: -42}));
  Expect.equals("default", test({1: 100}));
  Expect.equals("logical-and", test({2: 1}));
  Expect.equals("default", test({2: 10}));
  Expect.equals("relational", test({3: 1}));
  Expect.equals("default", test({3: 0}));
  Expect.equals("cast", test({4: 42}));
  Expect.throws(() {test({4: "42"});});
  Expect.equals("default", test(<int, int>{4: 42}));
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
  Expect.equals("list-2", test({10: ["42", 42]}));
  Expect.equals("default", test({10: [Object(), 42]}));
  Expect.equals("map-1", test({11: {1: 42}}));
  Expect.equals("map-2", test({11: {"1": 42}}));
  Expect.equals("default", test({11: {Object(): 42}}));
  Expect.equals("record-1", test({12: (42,)}));
  Expect.equals("record-2", test({12: (42, x: 0)}));
  Expect.equals("default", test({12: (42, 0)}));
  Expect.equals("default", test({12: (42, a: 0)}));
  Expect.equals("object", test({13: Square(1)}));
  Expect.equals("default", test({13: Square(2)}));
}
