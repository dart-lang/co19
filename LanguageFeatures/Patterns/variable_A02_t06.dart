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
/// @description Check that if the type annotation is specified then the
/// the pattern matches values of the appropriate type only. Test Object pattern
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns,records

import "../../Utils/static_type_helper.dart";
import "../../Utils/expect.dart";
import "patterns_lib.dart";

String test(Shape shape) {
  switch (shape) {
    case Square(area: double d1):
      return "Square(area: double $d1)";
    case Square(area: Unit a):
      a.expectStaticType<Exactly<Unit>>();
      return "Square(area: $a)";
    case Circle(size: double d2):
      b.expectStaticType<Exactly<Unit>>();
      return "Circle(size: double $d2)";
    case Circle(size: Unit b):
      b.expectStaticType<Exactly<Unit>>();
      return "Circle(size: $b)";
    default:
      return "default";
  }
}

main() {
  Expect.equals("Square(area: 1.00)", test(Square(1)));
  Expect.equals("Square(area: 4.00)", test(Square(2)));
  Expect.equals("Circle(size: 1.00)", test(Circle(1)));
  Expect.equals("default", test(Shape()));
}
