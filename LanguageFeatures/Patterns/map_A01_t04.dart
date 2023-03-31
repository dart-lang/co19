// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
/// mapPattern        ::= typeArguments? '{' mapPatternEntries? '}'
/// mapPatternEntries ::= mapPatternEntry ( ',' mapPatternEntry )* ','?
/// mapPatternEntry   ::= expression ':' pattern
///
/// A map pattern matches values that implement Map and accesses values by key
/// from it.
/// It is a compile-time error if:
/// - typeArguments is present and there are more or fewer than two type
///   arguments.
/// - Any of the entry key expressions are not constant expressions.
/// - Any two keys in the map are identical.
/// - Any two record keys which both have primitive equality are equal.
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
  Expect.equals(3, m2[1]?.val);

  Expect.throws(() {
    var {1: a, 2: b} = {1: "1"};
  });
  Expect.throws(() {
    final {1: a, 2: b!} = {1: 1, 2: null};
  });
  Expect.throws(() {
    var {1: a, 2: b} = {1: "1", 2: "2", 3: "3"};
  });
}
