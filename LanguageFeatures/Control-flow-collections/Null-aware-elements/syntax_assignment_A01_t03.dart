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
/// @description Check that an expression in a `nullAwareMapElement` and a
/// `nullAwareExpressionElement` can be in a form
/// `⟨assignableExpression⟩ ⟨assignmentOperator⟩ ⟨expression⟩`.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=null-aware-elements

import '../../../Utils/expect.dart';

extension on int? {
  int? operator ^(int? other) {
    if (this != null && other != null) {
      return this! ^ other;
    }
    return null;
  }

  int? operator &(int? other) {
    if (this != null && other != null) {
      return this! & other;
    }
    return null;
  }

  int? operator |(int? other) {
    if (this != null && other != null) {
      return this! | other;
    }
    return null;
  }

  int? operator ~/(int? other) {
    if (this != null && other != null) {
      return this! ~/ other;
    }
    return null;
  }
}

main() {
  int? x = 2 > 1 ? 1 : null;

  var list = [
    ?x ^= 1,
    ?x &= 2,
    ?x |= 3,
    ?x ~/= 1,
    ?x ^= null,
    ?x &= null,
    ?x |= null,
    ?x ~/= null
  ];
  Expect.listEquals([0, 0, 3, 3], list);

  x = 2 > 1 ? 1 : null;
  var set = {
    ?x ^= 1,
    ?x &= 2,
    ?x |= 3,
    ?x ~/= 1,
    ?x ^= null,
    ?x &= null,
    ?x |= null,
    ?x ~/= null
  };
  Expect.setEquals({3, 0}, set);

  x = 2 > 1 ? 3 : null;
  var map1 = {
    ?x ^= 1: 1,
    ?x &= 1: 2,
    ?x |= 3: 3,
    ?x ~/= 2: 4,
    ?x ^= null: 5,
    ?x &= null: 6,
    ?x |= null: 7,
    ?x ~/= null: 8
  };
  Expect.mapEquals({2: 1, 0: 2, 3: 3, 1: 4}, map1);

  x = 2 > 1 ? 1 : null;
  var map2 = {
    1: ?x ^= 1,
    2: ?x &= 1,
    3: ?x |= 3,
    4: ?x ~/= 2,
    5: ?x ^= null,
    6: ?x &= null,
    7: ?x |= null,
    8: ?x ~/= null
  };
  Expect.mapEquals({1: 0, 2: 0, 3: 3, 4: 1}, map2);

  x = 2 > 1 ? 1 : null;
  var map3 = {
    ?x ^= 1: ?x ^= 1,
    ?x &= 1: ?x &= 1,
    ?x |= 3: ?x |= 3,
    ?x ~/= 1: ?x ~/= 2,
    ?x ~/= null: ?x ~/= null,
    ?x &= null: ?x &= null,
    ?x |= null: ?x |= null,
    ?x ~/= null: ?x ~/= null,
  };
  Expect.mapEquals({0: 1, 1: 1, 3: 1}, map3);
}
