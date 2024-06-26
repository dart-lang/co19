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
/// @description Check that it is not a syntax error to use a logical expression
/// as an expression in a `nullAwareMapElement` or `nullAwareExpressionElement`.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=null-aware-elements

// TODO(sgrekhov): replace unspecified by the actual lint name

import '../../../Utils/expect.dart';

main() {
  var list = [
    ?true || false,
//  ^
// [analyzer] unspecified
    ?true && false
//  ^
// [analyzer] unspecified
  ];
  Expect.listEquals([true, false], list);

  var set = {
    ?true || false,
//  ^
// [analyzer] unspecified
    ?true && false
//  ^
// [analyzer] unspecified
  };
  Expect.setEquals({true, false}, set);

  var map1 = {
    ?true || false: true,
//  ^
// [analyzer] unspecified
    false: ?false && true
//         ^
// [analyzer] unspecified
  };
  Expect.mapEquals({true: true, false: false}, map1);

  var map2 = {
    ?true || false: ?true && true
//  ^
// [analyzer] unspecified
  };
  Expect.mapEquals({true: true}, map2);
}
