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
/// @description Check that an `await` expression can be used as an expression
/// in a `nullAwareMapElement` or `nullAwareExpressionElement`.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=null-aware-elements

import '../../../Utils/expect.dart';

Future<int?> foo(int? v) async {
  return Future.value(v);
}

main() async {
  var list = [
    ?await foo(1),
    ?await foo(null)
  ];
  Expect.listEquals([1], list);

  var set = {
    ?await foo(1),
    ?await foo(null)
  };
  Expect.setEquals({1}, set);

  var map = {
    ?await foo(1): 1,
    ?await foo(null): 2,
    3: ?await foo(3),
    4: ?await foo(null),
    ?await foo(5): ?await foo(5),
    ?await foo(null): ?await foo(null)
  };
  Expect.mapEquals({1: 1, 3: 3, 5: 5}, map);
}
