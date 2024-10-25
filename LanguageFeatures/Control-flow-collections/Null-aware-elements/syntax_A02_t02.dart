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
/// @description Check that it is not an error to have a comments between `?`
/// and `expression`
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=null-aware-elements

import '../../../Utils/expect.dart';

main() {
  int? v1 = 2 > 1 ? 1 : null;
  int? v2 = 1 > 2 ? 2 : null;
  String? key1 = 2 > 1 ? "key1" : null;
  String? key2 = 1 > 2 ? "key2" : null;

  var l1 = [
    ?/* comment*/ v1,
    ? // another comment
    v2
  ];
  Expect.listEquals([v1], l1);

  var s1 = {
    ? /* comment */v1,
    ? // another comment
    v2
  };
  Expect.setEquals({v1}, s1);

  var m1 = {
    ? /* comment */key1: 1,
    ? // another comment
    key2: 2
  };
  Expect.mapEquals({key1: 1}, m1);

  var m2 = {
    ? /* comment*/ key1: ? // another comment
      v1,
    ? // comment
    key2: ? /* another comment */ v1
  };
  Expect.mapEquals({key1: v1}, m2);

  var m3 = {
    "key1": ? /* comment */ v1,
    "key2": ? // another comment
          v2
  };
  Expect.mapEquals({key1: v1}, m3);
}
