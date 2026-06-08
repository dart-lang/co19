// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We extend the list grammar to allow spread elements in addition to
/// regular elements:
/// listLiteral:
///   const? typeArguments? '[' spreadableList? ']'
///   ;
///
///   spreadableList:
///   spreadableExpression ( ',' spreadableExpression )* ','?
///   ;
///
///   spreadableExpression:
///   expression |
///   spread
///   ;
///
///   spread:
///   ( '...' | '...?' ) expression
///   ;
///
/// Instead of [expressionList], this uses a new [spreadableList] rule since
/// [expressionList] is used elsewhere in the grammar where spreads aren't
/// allowed. Each element in a list is either a normal expression or a spread
/// element. If the spread element starts with [...?], it's a null-aware spread
/// element.
///
/// @description Checks that spreadable element can have type argument
/// @author iarkh@unipro.ru

main() {
  List<int> list1 = [1, 2, 3];
  List<String> list2 = ["a"];
  List<int> list3 = [0, 2, 4, 6, 8];

  <String>[...list1];
//            ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  <String>["123", ...list1];
//                   ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  <String>[...list1, "123"];
//            ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  <int>[...list1, "123"];
//                ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  <int>["123", list1];
//      ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  <int>[...list1, ...list2, ...list3];
//                   ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
