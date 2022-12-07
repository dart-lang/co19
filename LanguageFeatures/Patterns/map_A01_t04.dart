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
/// @description Checks a map pattern in a declaration context
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns

import "../../Utils/expect.dart";

const two = 2;

class C {
  int val;
  C(this.val);
}

main() {
  var m1 = {1: "1", 2: "2"};
  var <Object, String>{1: String _, two: a1} = m1;
  Expect.equals("2", a1);
  a1 = "3";
  Expect.equals("2", m1[two]);

  final {"1": a2, "2": int b2} = {"1": 1, "2": 2};
  Expect.equals(1, a2);
  Expect.equals(2, b2);

  Map<int, C> m2 = {1: C(1)};
  var {1: a3} = m2;
  Expect.equals(1, a3.val);
  a3.val = 3;
  Expect.equals(3, m2[1].val);

  Expect.throws(() {
    var {1: a, 2: b} = {1: "1"};
  });
  Expect.throws(() {
    final {1: a, 2: String b} = {1: 1, 2: 2};
  });
  Expect.throws(() {
    final {1: a, 2: b!} = {1: 1, 2: null};
  });
  Expect.throws(() {
    var {1: a, 2: b} = {1: "1", 2: "2", 3: "3"};
  });
}
