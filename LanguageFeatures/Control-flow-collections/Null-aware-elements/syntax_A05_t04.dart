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
/// @description Check that it is not an error if `nullAwareExpressionElement`
/// and `nullAwareMapElement` contain conditional, if-null and null-aware
/// expressions
/// @author sgrekhov22@gmail.com

import '../../../Utils/expect.dart';

int? f(int? v) => v;
bool b(bool v) => v;

main() {
  var list = [
    ?b(true) ? f(null)?.abs() ?? 1 : null, // ? true ? (null ?? 1): null
    ?b(true) ? f(2)?.abs() ?? 1 : null, // ? true ? (2 ?? 1): null
    ?b(false) ? f(3)?.abs() ?? 1 : null, // ? false ? (3 ?? 1): null
    ?b(true) ? f(null)?.abs() ?? null : 4 // ? true ? (null ?? null): 4
  ];
  Expect.listEquals([1, 2], list);

  var set = {
    ?b(true) ? f(null)?.abs() ?? 1 : null, // ? true ? (null ?? 1): null
    ?b(true) ? f(2)?.abs() ?? 1 : null, // ? true ? (2 ?? 1): null
    ?b(false) ? f(3)?.abs() ?? 1 : null, // ? false ? (3 ?? 1): null
    ?b(true) ? f(null)?.abs() ?? null : 4 // ? true ? (null ?? null): 4
  };
  Expect.setEquals({1, 2}, set);

  var map = {
    ?b(true) ? f(null)?.abs() ?? 1 : null: 0, // ?(true ? (null ?? 1): null): 0
    ?b(true) ? f(2)?.abs() ?? null : null: 0, // ?(true ? (2 ?? null): null): 0
    ?b(false) ? f(3)?.abs() ?? 1 : null: 0, // ?(false ? (3 ?? 1): null): 0
    ?b(true) ? f(null)?.abs() ?? null : 4: 0, // ?(true ? (null ?? null): 4): 0

    5: ?b(true) ? f(null)?.abs() ?? 1 : null, // 5: ?(true ? (null ?? 1): null)
    6: ?b(true) ? f(2)?.abs() ?? null : null, // 6: ?(true ? (2 ?? null): null)
    7: ?b(false) ? f(3)?.abs() ?? 1 : null, // 7: ?(false ? (3 ?? 1): null)
    8: ?b(true) ? f(null)?.abs() ?? null : 4, // 8: ?(true ? (null ?? null): 4)

    ?b(true) ? f(null)?.abs() ?? 7: null:
      ?b(false) ? null: f(null)?.abs() ?? 7, // ?(true ? (null ?? 7): null): ?(false ? null: (null ?? 7))
    ?b(true) ? f(8)?.abs() ?? null: null:
      ?b(false) ? null: f(8)?.abs() ?? null, // ?(true ? (8 ?? null): null): ?(false ? null : (8 ?? null)
    ?b(false) ? f(9)?.abs() ?? 1 : null:
      ?b(true) ? f(9)?.abs() ?? 1 : null, // ?(false ? (9 ?? 1): null): ?(true ? (9 ?? 1): null)
    ?b(true) ? f(null)?.abs() ?? 10 : 11: // ignore: invalid_null_aware_operator
      ?b(true) ? f(null)?.abs() ?? null : 11 // ?(true ? (null ?? 10): 11): ?(true ? (null ?? null): 11)
  };
  Expect.mapEquals({1: 0, 2: 0, 5: 1, 6: 2, 7: 7, 8: 8}, map);
}
