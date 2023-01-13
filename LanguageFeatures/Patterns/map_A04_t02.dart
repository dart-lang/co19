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
/// @description Check that it is no compile-time error if any two keys in the
/// map are equal according to their == operator, but not identical
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns

import "../../Utils/expect.dart";

class C {
  final x;
  const C(this.x);

  @override
  bool operator ==(Object other) {
    if (other is C) {
      return this.x == other.x;
    }
    return false;
  }

  @override
  int get hashCode => x;
}

const c1 = C(1);
const c2 = C(2);
const c3 = C(3);

String test1(Map map) {
  return switch (map) {
    {c1: var a, c2: final b} => "a=$a, b=$b",
    _ => "default"
  };
}

String test2(Map map) {
  switch (map) {
    case {c1: var a, c2: final b}:
      return "a=$a, b=$b";
    default:
      return "default";
  }
}

String test3(Map map) {
  if (map case {c1: var a, c2: final b}) {
    return "a=$a, b=$b";
  }
  return "default";
}

main() {
  Expect.throws(() {
    var {c1: a, c2: b} = {3.14: 1};
  });
  Expect.throws(() {
    var {c1: a, c2: b} = {3.14: 1, 3.14: 2, 3.14: 3};
  });
  var {c1: a1, c2: b1} = {c1: 1, c2: 2};
  Expect.equals(1, a1);
  Expect.equals(2, b1);
  final {c1: int a2, c2: int b2} = {c1: 1, c2: 2};
  Expect.equals(1, a2);
  Expect.equals(2, b2);

  Expect.equals("a=2, b=2", test1({c1: 1, c2: 2}));
  Expect.equals("default", test1({c1: 1}));
  Expect.equals("default", test1({c1: 1, c2: 2, c3: 3}));
  Expect.equals("a=2, b=2", test2({c1: 1, c1: 2}));
  Expect.equals("default", test2({c1: 1}));
  Expect.equals("default", test2({c1: 1, c2: 2, c3: 3}));
  Expect.equals("a=2, b=2", test3({c1: 1, c2: 2}));
  Expect.equals("default", test3({c1: 1}));
  Expect.equals("default", test3({c1: 1, c2: 2, c3: 3}));
}
