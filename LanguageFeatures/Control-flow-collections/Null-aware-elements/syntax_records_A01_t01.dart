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
/// @description Check that it is not a syntax error to use a record as an
/// expression in a `nullAwareMapElement` or `nullAwareExpressionElement`.
/// @author sgrekhov22@gmail.com

import '../../../Utils/expect.dart';

main() {
  var list = [
    ?(1, name: 2),
//  ^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
    ?(null, name: null),
//  ^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
    ?const (3, name: 4),
//  ^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
    ?const (null, name: null),
//  ^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
  ];
  Expect.listEquals([
    (1, name: 2),
    (null, name: null),
    (3, name: 4),
    (null, name: null)
  ], list);

  var set = {
    ?(1, name: 2),
//  ^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
    ?(null, name: null),
//  ^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
    ?const (3, name: 4),
//  ^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
    ?const (null, name: null),
//  ^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
  };
  Expect.setEquals({
    (1, name: 2),
    (null, name: null),
    (3, name: 4)
  }, set);

  var map1 = {
    ?(1, name: 2): 1,
//  ^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
    ?(null, name: null): 2,
//  ^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
    ?const (3, name: 4): 3,
//  ^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
    ?const (null, name: null): 4,
//  ^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
    5: ?(1, name: 2),
//     ^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
    6: ?(null, name: null),
//     ^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
    7: ?const (3, name: 4),
//     ^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
    8: ?const (null, name: null)
//     ^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
  };
  Expect.mapEquals({
    (1, name: 2): 1,
    (null, name: null): 4,
    (3, name: 4): 3,
    5: (1, name: 2),
    6: (null, name: null),
    7: (3, name: 4),
    8: (null, name: null)
  }, map1);

  var map2 = {
    ?(1, name: 2): ?(1, name: 2),
//  ^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
//                 ^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
    ?(null, name: null): ?(null, name: null),
//  ^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
//                       ^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
    ?const (3, name: 4): ?const (3, name: 4),
//  ^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
//                       ^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
    ?const (null, name: null): ?const (null, name: null)
//  ^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
//                             ^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
  };
  Expect.mapEquals({
    (1, name: 2): (1, name: 2),
    (null, name: null): (null, name: null),
    (3, name: 4): (3, name: 4)
  }, map2);
}
