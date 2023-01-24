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
/// pattern matches values of the appropriate type only. Test map pattern
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns

import "../../Utils/static_type_helper.dart";
import "../../Utils/expect.dart";

String test1(Map m) {
  switch (m) {
    case ({1: String a}):
      a.expectStaticType<Exactly<String>>();
      return "{1: <String>$a}";
    case ({1: final int b}):
      b.expectStaticType<Exactly<int>>();
      return "{1: <int>$b}";
    default:
      return "default";
  }
}

String test2(Map m) {
  return switch (m) {
    ({1: String a}) => "{1: <String>$a}",
    ({1: final int b}) => "{1: <int>$b}",
    _ => "default"
  };
}

String test3(Map m) {
  if (m case ({1: String a})) {
    a.expectStaticType<Exactly<String>>();
    return "{1: <String>$a}";
  }
  if (m case ({1: final int b})) {
    b.expectStaticType<Exactly<int>>();
    return "{1: <int>$b}";
  } else {
    return "default";
  }
}

main() {
  Expect.equals("{1: <String>x}", test1({1: "x"}));
  Expect.equals("{1: <int>2}", test1({1: 2}));
  Expect.equals("default", test1({1: true}));

  Expect.equals("{1: <String>x}", test2({1: "x"}));
  Expect.equals("{1: <int>2}", test2({1: 2}));
  Expect.equals("default", test2({1: true}));

  Expect.equals("{1: <String>x}", test3({1: "x"}));
  Expect.equals("{1: <int>2}", test3({1: 2}));
  Expect.equals("default", test3({1: true}));
}
