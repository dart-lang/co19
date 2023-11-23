// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An if element:
/// It is a compile-time error if the condition expression is not constant or
/// does not evaluate to true or false.
///
/// @description Checks that it is a compile-time error if the condition
/// expression is not constant
/// @author sgrekhov@unipro.ru

main() {
  var x = 1;
  List<int> list1 = const [if (x > 0) 1, 1 ];
//                             ^
// [analyzer] COMPILE_TIME_ERROR.NON_CONSTANT_LIST_ELEMENT
// [cfe] Not a constant expression.
  const List<int> list2 = [if (x > 0) 1, 1 ];
//                             ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  var list3 = const [if (x > 0) 1, 1, ];
//                       ^
// [analyzer] COMPILE_TIME_ERROR.NON_CONSTANT_LIST_ELEMENT
// [cfe] Not a constant expression.
  var list4 = const <int>[if (x > 0) 1, 1, ];
//                            ^
// [analyzer] COMPILE_TIME_ERROR.NON_CONSTANT_LIST_ELEMENT
// [cfe] Not a constant expression.
  const list5 = [if (x > 0) 1, 1 ];
//                   ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  Set<int> set1 = const {if (x > 0) 1, -1 };
//                           ^
// [analyzer] COMPILE_TIME_ERROR.NON_CONSTANT_SET_ELEMENT
// [cfe] Not a constant expression.
  const Set<int> set2 = {if (x > 0) 1, -1 };
//                           ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  var set3 = const {if (x > 0) 1, -1, };
//                      ^
// [analyzer] COMPILE_TIME_ERROR.NON_CONSTANT_SET_ELEMENT
// [cfe] Not a constant expression.
  var set4 = const <int>{if (x > 0) 1, -1, };
//                           ^
// [analyzer] COMPILE_TIME_ERROR.NON_CONSTANT_SET_ELEMENT
// [cfe] Not a constant expression.
  const set5 = {if (x > 0) 1, -1 };
//                  ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  Map<int, String> map1 = const {if (x > 0) 1: "1"};
//                                   ^
// [analyzer] COMPILE_TIME_ERROR.NON_CONSTANT_MAP_ELEMENT
// [cfe] Not a constant expression.
  const Map<int, String> map2 = {if (x > 0) 1: "x"};
//                                   ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  var map3 = const {if (x > 0) 1: "x"};
//                      ^
// [analyzer] COMPILE_TIME_ERROR.NON_CONSTANT_MAP_ELEMENT
// [cfe] Not a constant expression.
  var map4 = const <int, String>{if (x > 0) 1: "x"};
//                                   ^
// [analyzer] COMPILE_TIME_ERROR.NON_CONSTANT_MAP_ELEMENT
// [cfe] Not a constant expression.
  const map5 = {if (x > 0) 1: "x" };
//                  ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
