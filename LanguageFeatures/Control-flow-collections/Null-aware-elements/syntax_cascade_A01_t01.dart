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
/// `nullAwareExpressionElement` can be a cascade expression.
/// @author sgrekhov22@gmail.com

import '../../../Utils/expect.dart';

class C {
  int i;
  C(this.i);

  @override
  bool operator ==(Object? other) {
    if (other is C) {
      return this.i == other.i;
    }
    return false;
  }

  Null increment() {
    ++i;
    return null;
  }

  Null doubleIncrement() {
    i += 2;
    return null;
  }

  String toString() => "C($i)";
}

main() {
  C? c1 = 2 > 1 ? C(1) : null; // C(1)
  C? c2 = 2 > 1 ? null : C(2); // null

  var list = [
    ?c1
      ?..increment()
      ..doubleIncrement(),
    ?c2
      ?..increment()
      ..doubleIncrement(),
  ];
  Expect.listEquals([c1], list);

  var set = {
    ?c1
      ?..increment()
      ..doubleIncrement(),
    ?c2
      ?..increment()
      ..doubleIncrement()
  };
  Expect.setEquals({c1}, set);

  var map1 = {
    ?c1
      ?..increment()
      ..doubleIncrement(): 1,
    ?c2
      ?..increment()
      ..doubleIncrement(): 2,
    3: ?c1
      ?..increment()
      ..doubleIncrement(),
    4: ?c2
      ?..increment()
      ..doubleIncrement()
  };
  Expect.mapEquals({c1: 1, 3: c1}, map1);

  var map2 = {
    ?c1
      ?..increment()
      ..doubleIncrement(): ?c1
      ?..increment()
      ..doubleIncrement(),
    ?c2
      ?..increment()
      ..doubleIncrement(): ?c2
      ?..increment()
      ..doubleIncrement()
  };
  Expect.mapEquals({c1: c1}, map2);
}
