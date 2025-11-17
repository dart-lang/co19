// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We add two new rules in the grammar and add two new clauses to
/// element:
///
/// element ::=
///   | nullAwareExpressionElement
///   | nullAwareMapElement
///   | // Existing productions...
///
/// nullAwareExpressionElement ::= '?' expression
///
/// nullAwareMapElement ::=
///   | '?' expression ':' '?'? expression // Null-aware key or both.
///   |     expression ':' '?' expression  // Null-aware value.
///
/// @description Check that it is not a syntax error to use unary prefix
/// expression in the form `!e` in a `nullAwareMapElement` or
/// `nullAwareExpressionElement`.
/// @author sgrekhov22@gmail.com

// TODO(sgrekhov): replace unspecified by the actual lint name

import '../../../Utils/expect.dart';

main() {
  var list = [
    ?!true,
//  ^
// [analyzer] unspecified
    ?!(1 > 2)
//  ^
// [analyzer] unspecified
  ];
  Expect.listEquals([false, true], list);

  var set = {
    ?!true,
//  ^
// [analyzer] unspecified
    ?!(1 > 2)
//  ^
// [analyzer] unspecified
  };
  Expect.setEquals({false, true}, set);

  var map1 = {
    ?!true: 1,
//  ^
// [analyzer] unspecified
    ?!(1 > 2): 2,
//  ^
// [analyzer] unspecified
    3: ?!true,
//     ^
// [analyzer] unspecified
    4: ?!(1 > 2)
//     ^
// [analyzer] unspecified
  };
  Expect.mapEquals({false: 1, true: 2, 3: false, 4: true}, map1);

  var map2 = {
    ?!true: ?!true,
//  ^
// [analyzer] unspecified
    ?!(1 > 2): ?!(1 > 2),
//  ^
// [analyzer] unspecified
  };
  Expect.mapEquals({false: false, true: true}, map2);
}
