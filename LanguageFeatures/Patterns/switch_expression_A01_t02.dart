// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
/// primary                 ::= // Existing productions...
///                           | switchExpression
///
/// switchExpression      ::= 'switch' '(' expression ')' '{'
///                           switchExpressionCase ( ',' switchExpressionCase )*
///                           ','? '}'
/// switchExpressionCase  ::= guardedPattern '=>' expression
///
/// The body is a series of cases. Each case has a pattern, optional guard, and
/// a single expression body. As with other expression forms containing a list
/// of subelements (argument lists, collection literals), the cases are
/// separated by commas with an optional trailing comma. Since the body of each
/// case is a single expression with a known terminator, it's easy to tell when
/// one case ends and the next begins. That lets us do away with the case
/// keyword.
///
/// To keep the syntax small and light, we also disallow a default clause.
/// Instead, you can use a shorter _ wildcard pattern to catch any remaining
/// values.
///
/// @description Check that it is a compile-time error if a switch expression
/// uses `:` instead of '=>'
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns

main () {
  int i = 42;
  var x = switch(i) {
    1: "one"
//   ^
// [analyzer] unspecified
// [cfe] unspecified
    _ => "any"
  };

  var y = switch(i) {
    1 => "one",
    _: "zero"
//   ^
// [analyzer] unspecified
// [cfe] unspecified
  };

  var z = switch(i) {
    1: "one",
//   ^
// [analyzer] unspecified
// [cfe] unspecified
    _: "zero"
//   ^
// [analyzer] unspecified
// [cfe] unspecified
  };
}
