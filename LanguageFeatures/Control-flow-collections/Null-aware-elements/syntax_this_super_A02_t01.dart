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
/// @description Check that `this` can be used in an expression in a
/// `nullAwareMapElement` and a `nullAwareExpressionElement`.
/// @author sgrekhov22@gmail.com

import '../../../Utils/expect.dart';

class C {
  void test() {
    var l = [?this];
//           ^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
    Expect.listEquals([this], l);

    var s = {?this};
//           ^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
    Expect.setEquals({this}, s);

    var m = {
      ?this: 1,
//    ^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
      2: ?this,
//       ^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
      ?this: ?this,
//    ^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
    };
    Expect.mapEquals({
      this: 1,
      2: this,
      this: this,
    }, m);
  }
}

main() {
  C().test();
}
