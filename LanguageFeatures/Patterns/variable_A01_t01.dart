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

main() {
  var (a, b) = (1, 3.14);
  Expect.equals(1, a);
  Expect.equals(3.14, b);
  a.expectStaticType<Exactly<int>>();
  b.expectStaticType<Exactly<double>>();
  (a, b) = (3, 4); // to check that a and b are not final
  Expect.equals(3, a);
  Expect.equals(4, b);

  final (c, d) = (5, "6");
  c.expectStaticType<Exactly<int>>();
  d.expectStaticType<Exactly<String>>();
  Expect.equals(5, c);
  Expect.equals("6", d);
}
