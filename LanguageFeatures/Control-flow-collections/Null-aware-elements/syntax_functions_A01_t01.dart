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
/// @description Check that a function literal and a constructor tear-off can be
/// used as an expression in a `nullAwareMapElement` and a
/// `nullAwareExpressionElement`.
/// @author sgrekhov22@gmail.com

// TODO(sgrekhov): replace unspecified by the actual lint name

import '../../../Utils/expect.dart';

class C {}

main() {
  var list = [
    ?C.new,
//  ^
// [analyzer] unspecified
    ?() {},
//  ^
// [analyzer] unspecified
    ?() async {},
//  ^
// [analyzer] unspecified
    ?() => 1,
//  ^
// [analyzer] unspecified
    ?() async => 1
//  ^
// [analyzer] unspecified
  ];
  // We can't use Expect.listEquals() to verify the outcome. () {} != () {}
  Expect.isTrue(list is List<Function>);
  Expect.equals(5, list.length);

  var set = {
    ?C.new,
//  ^
// [analyzer] unspecified
    ?() {},
//  ^
// [analyzer] unspecified
    ?() async {},
//  ^
// [analyzer] unspecified
    ?() => 1,
//  ^
// [analyzer] unspecified
    ?() async => 1
//  ^
// [analyzer] unspecified
  };
  Expect.isTrue(set is Set<Function>);
  Expect.equals(5, set.length);

  var map1 = {
    ?C.new: 1,
//  ^
// [analyzer] unspecified
    ?() {}: 2,
//  ^
// [analyzer] unspecified
    ?() async {}: 3,
//  ^
// [analyzer] unspecified
    ?() => 1: 4,
//  ^
// [analyzer] unspecified
    ?() async => 1: 5
//  ^
// [analyzer] unspecified
  };
  Expect.isTrue(map1 is Map<Function, int>);
  Expect.equals(5, map1.keys.length);

  var map2 = {
    1: ?C.new,
//     ^
// [analyzer] unspecified
    2: ?() {},
//     ^
// [analyzer] unspecified
    3: ?() async {},
//     ^
// [analyzer] unspecified
    4: ?() => 1,
//     ^
// [analyzer] unspecified
    5: ?() async => 1
//     ^
// [analyzer] unspecified
  };
  Expect.isTrue(map2 is Map<int, Function>);
  Expect.equals(5, map2.values.length);

  var map3 = {
    ?C.new: ?C.new,
//  ^
// [analyzer] unspecified
    ?() {}: ?() {},
//  ^
// [analyzer] unspecified
    ?() async {}: ?() async {},
//  ^
// [analyzer] unspecified
    ?() => 1: ?() => 1,
//  ^
// [analyzer] unspecified
    ?() async => 1: ?() async => 1
//  ^
// [analyzer] unspecified
  };
  Expect.isTrue(map3 is Map<Function, Function>);
  Expect.equals(5, map3.keys.length);
}
