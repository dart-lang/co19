// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An if element:
/// ...
/// It is a compile-time error if the condition evaluates to false and the else
/// expression, if it exists, is not a constant expression.
///
/// @description Checks that it is a compile-time error if the condition
/// evaluates to false and the else expression is not a constant expression.
/// @author ngl@unipro.ru

main() {
  const t = false;
  var x = 1;
  List<int> list1 = const [if (t) 1 else x];
//                                       ^
// [analyzer] unspecified
// [cfe] unspecified
  const List<int> list2 = [if (t) 2 else x + 1];
//                                       ^
// [analyzer] unspecified
// [cfe] unspecified
  var list3 = const [if (t) 3 else x - 1];
//                                 ^
// [analyzer] unspecified
// [cfe] unspecified
  var list4 = const <int>[if (t) 4 else x - 2];
//                                      ^
// [analyzer] unspecified
// [cfe] unspecified
  const list5 = [if (t) 5 else x + 2];
//                             ^
// [analyzer] unspecified
// [cfe] unspecified

  Set<int> set1 = const {if (t) 1 else x};
//                                     ^
// [analyzer] unspecified
// [cfe] unspecified
  const Set<int> set2 = {if (t) 2 else x - 1};
//                                     ^
// [analyzer] unspecified
// [cfe] unspecified
  var set3 = const {if (t) 3 else x + 1};
//                                ^
// [analyzer] unspecified
// [cfe] unspecified
  var set4 = const <int>{if (t) 4 else x + 2};
//                                     ^
// [analyzer] unspecified
// [cfe] unspecified
  const set5 = {if (t) 5 else x - 2};
//                            ^
// [analyzer] unspecified
// [cfe] unspecified

  Map<int, String> map1 = const {if (t) 1: "1x" else x: "x"};
//                                                   ^
// [analyzer] unspecified
// [cfe] unspecified
  const Map<int, String> map2 = {if (t) 2: "2x" else x - 1: "x-1"};
//                                                   ^
// [analyzer] unspecified
// [cfe] unspecified
  var map3 = const {if (t) 3: "3x" else x + 1: "x+1"};
//                                      ^
// [analyzer] unspecified
// [cfe] unspecified
  var map4 = const <int, String>{if (t) 4: "4x" else x - 2: "x-2"};
//                                                   ^
// [analyzer] unspecified
// [cfe] unspecified
  const map5 = {if (t) 5: "5x" else x + 2: "x+2"};
//                                  ^
// [analyzer] unspecified
// [cfe] unspecified
}
