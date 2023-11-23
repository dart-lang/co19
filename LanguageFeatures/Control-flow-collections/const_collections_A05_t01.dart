// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An if element:
/// ...
/// It is a compile-time error if the condition evaluates to true and the then
/// expression is not a constant expression.
///
/// @description Checks that it is a compile-time error if the condition
/// evaluates to true and the then expression is not a constant expression.
/// @author ngl@unipro.ru

main() {
  const t = true;
  var x = 1;
  List<int> list1 = const [if (t) x];
//                                ^
// [analyzer] COMPILE_TIME_ERROR.NON_CONSTANT_LIST_ELEMENT
// [cfe] Not a constant expression.
  const List<int> list2 = [if (t) x + 1];
//                                ^
// [analyzer] unspecified
// [cfe] unspecified
  var list3 = const [if (t) x];
//                          ^
// [analyzer] COMPILE_TIME_ERROR.NON_CONSTANT_LIST_ELEMENT
// [cfe] Not a constant expression.
  var list4 = const <int>[if (t) x];
//                               ^
// [analyzer] COMPILE_TIME_ERROR.NON_CONSTANT_LIST_ELEMENT
// [cfe] Not a constant expression.
  const list5 = [if (t) x];
//                      ^
// [analyzer] unspecified
// [cfe] unspecified

  Set<int> set1 = const {if (t) x, -1};
//                              ^
// [analyzer] COMPILE_TIME_ERROR.NON_CONSTANT_SET_ELEMENT
// [cfe] Not a constant expression.
  const Set<int> set2 = {if (t) x - 1, -1};
//                              ^
// [analyzer] unspecified
// [cfe] unspecified
  var set3 = const {if (t) x, -1};
//                         ^
// [analyzer] COMPILE_TIME_ERROR.NON_CONSTANT_SET_ELEMENT
// [cfe] Not a constant expression.
  var set4 = const <int>{if (t) x + 1, -1};
//                              ^
// [analyzer] COMPILE_TIME_ERROR.NON_CONSTANT_SET_ELEMENT
// [cfe] Not a constant expression.
  const set5 = {if (t) x, -1};
//                     ^
// [analyzer] unspecified
// [cfe] unspecified

  Map<int, String> map1 = const {if (t) x - 1: "0"};
//                                      ^
// [analyzer] COMPILE_TIME_ERROR.NON_CONSTANT_MAP_KEY
// [cfe] Not a constant expression.
  const Map<int, String> map2 = {if (t) x: "1"};
//                                      ^
// [analyzer] unspecified
// [cfe] unspecified
  var map3 = const {if (t) x + 1: "2"};
//                         ^
// [analyzer] COMPILE_TIME_ERROR.NON_CONSTANT_MAP_KEY
// [cfe] Not a constant expression.
  var map4 = const <int, String>{if (t) x: "x"};
//                                      ^
// [analyzer] COMPILE_TIME_ERROR.NON_CONSTANT_MAP_KEY
// [cfe] Not a constant expression.
  const map5 = {if (t) x + 2: "3"};
//                     ^
// [analyzer] unspecified
// [cfe] unspecified
}
