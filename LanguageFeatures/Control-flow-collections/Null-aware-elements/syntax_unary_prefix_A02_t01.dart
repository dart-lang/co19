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

import '../../../Utils/expect.dart';

main() {
  var list = [
    ?!true,
//  ^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
    ?!(1 > 2)
//  ^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
  ];
  Expect.listEquals([false, true], list);

  var set = {
    ?!true,
//  ^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
    ?!(1 > 2)
//  ^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
  };
  Expect.setEquals({false, true}, set);

  var map1 = {
    ?!true: 1,
//  ^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
    ?!(1 > 2): 2,
//  ^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
    3: ?!true,
//     ^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
    4: ?!(1 > 2)
//     ^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
  };
  Expect.mapEquals({false: 1, true: 2, 3: false, 4: true}, map1);

  var map2 = {
    ?!true: ?!true,
//  ^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
//          ^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
    ?!(1 > 2): ?!(1 > 2),
//  ^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
//             ^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
  };
  Expect.mapEquals({false: false, true: true}, map2);
}
