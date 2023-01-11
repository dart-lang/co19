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
/// @description Check that if a variable pattern is a subpattern of a
/// final destructuring pattern then declared variable is final
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns,records

import "patterns_lib.dart";

main() {
  final (a, String b) = (1, "2");
  a = 2;
//^
// [analyzer] unspecified
// [cfe] unspecified
  b = "";
//^
// [analyzer] unspecified
// [cfe] unspecified
  final [int c, String d] = [1, "2"];
  c = 2;
//^
// [analyzer] unspecified
// [cfe] unspecified
  d = "";
//^
// [analyzer] unspecified
// [cfe] unspecified
  final {1: e} = {1: "2", 3: "4"};
  e = "3";
//^
// [analyzer] unspecified
// [cfe] unspecified

  final {1: String f} = {1: "2", 3: "4"};
  f = "3";
//^
// [analyzer] unspecified
// [cfe] unspecified

  final Square(area: g) = Square(1);
  g = Unit(42);
//^
// [analyzer] unspecified
// [cfe] unspecified

  final Square(area: Unit h) = Square(1);
  h = Unit(42);
//^
// [analyzer] unspecified
// [cfe] unspecified
}
