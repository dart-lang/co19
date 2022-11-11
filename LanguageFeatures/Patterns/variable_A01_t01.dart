// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
/// variablePattern ::= ( 'var' | 'final' | 'final'? type )? identifier
///
/// A variable pattern binds the matched value to a new variable. These usually
/// occur as subpatterns of a destructuring pattern in order to capture a
/// destructured value.
/// ```dart
/// var (a, b) = (1, 2);
/// ```
/// Here, a and b are variable patterns and end up bound to 1 and 2,
/// respectively.
///
/// The pattern may have a type annotation in order to only match values of the
/// specified type. If the type annotation is omitted, the variable's type is
/// inferred and the pattern matches all values.
/// ```dart
/// switch (record) {
///   case (int x, String s):
///     print('First field is int $x and second is String $s.');
/// }
/// ```
/// @description Checks a variable pattern in a as a subpattern of a
/// destructuting pattern
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns,records

import "../../Utils/static_type_helper.dart";
import "../../Utils/expect.dart";
import "patterns_lib.dart";

main() {
  var (a1, b1) = (1, 3.14);
  Expect.equals(1, a1);
  Expect.equals(3.14, b1);
  a1.expectStaticType<Exactly<int>>();
  b1.expectStaticType<Exactly<double>>();
  (a1, b1) = (3, 4); // to check that a1 and b1 are not final
  Expect.equals(3, a1);
  Expect.equals(4, b1);

  final (c1, d1) = (5, "6");
  c1.expectStaticType<Exactly<int>>();
  d1.expectStaticType<Exactly<String>>();
  Expect.equals(5, c1);
  Expect.equals("6", d1);

  var [a2, b2] = [1, 3.14];
  Expect.equals(1, a2);
  Expect.equals(3.14, b2);
  a2.expectStaticType<Exactly<int>>();
  b2.expectStaticType<Exactly<double>>();
  [a2, b2] = [3, 4];
  Expect.equals(3, a2);
  Expect.equals(4, b2);

  final (c2, d2) = (5, "6");
  c2.expectStaticType<Exactly<int>>();
  d2.expectStaticType<Exactly<String>>();
  Expect.equals(5, c2);
  Expect.equals("6", d2);

  var {1: a3} = {1: "3.14"};
  Expect.equals("3.14", a3);
  a3.expectStaticType<Exactly<String>>();
  {1: a3} = {1: "42"};
  Expect.equals("42", a3);

  final {5: d3} = {5: "6"};
  d3.expectStaticType<Exactly<String>>();
  Expect.equals("6", d3);

  var Square(area: var a4) = Square(1);
  Expect.equals(a4, 1);
  a4 = Loggable(42);
  a4.expectStaticType<Exactly<Loggable>>();

  var Square(area: final d4) = Square(1);
  d4.expectStaticType<Exactly<Loggable>>();
  Expect.equals(d4, 1);
}
