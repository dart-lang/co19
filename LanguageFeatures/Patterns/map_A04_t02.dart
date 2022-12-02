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
/// @description Check that it is no compile-time error if any two keys in the
/// map are equal according to their == operator, but have no primitive ==
/// methods
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns

import "../../Utils/expect.dart";

String test1(Map map) {
  return switch (map) {
    case {3.14: var a, 3.14: final b} => "a=$a, b=$b";
    default => "default";
  };
}

String test2(Map map) {
  switch (map) {
    case {3.14: var a, 3.14: final b}:
      return "a=$a, b=$b";
    default:
      return "default";
  }
}

String test3(Map map) {
  if (map case {3.14: var a, 3.14: final b}) {
    return "a=$a, b=$b";
  }
  return "default";
}

main() {
  Expect.throws(() {
    var {3.14: a, 3.14: b} = {3.14: 1};
  });
  Expect.throws(() {
    var {3.14: a, 3.14: b} = {3.14: 1, 3.14: 2, 3.14: 3};
  });
  var {3.14: a1, 3.14: b1} = {3.14: 1, 3.14: 2};
  Expect.equals(2, a1);
  Expect.equals(2, b1);
  final {3.14: int a2, 3.14: int b2} = {3.14: 1, 3.14: 2};
  Expect.equals(2, a2);
  Expect.equals(2, b2);

  Expect.equals("a=2, b=2", test1({3.14: 1, 3.14: 2}));
  Expect.equals("default", test1({3.14: 1}));
  Expect.equals("default", test1({3.14: 1, 3.14: 2, 3.14: 3}));
  Expect.equals("a=2, b=2", test2({3.14: 1, 3.14: 2}));
  Expect.equals("default", test2({3.14: 1}));
  Expect.equals("default", test2({3.14: 1, 3.14: 2, 3.14: 3}));
  Expect.equals("a=2, b=2", test3({3.14: 1, 3.14: 2}));
  Expect.equals("default", test3({3.14: 1}));
  Expect.equals("default", test3({3.14: 1, 3.14: 2, 3.14: 3}));
}
