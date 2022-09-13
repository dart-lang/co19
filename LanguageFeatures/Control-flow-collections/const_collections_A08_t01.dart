// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A for element:
///
/// These are disallowed in constant collections
///
/// @description Checks that a 'for' element is disallowed in a constant
/// collections
/// @author sgrekhov@unipro.ru

main() {
  List<int> list1 = const [for (var i = 1; i < 4; i++) i];
//                         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  const List<int> list2 = [for (var i = 1; i < 4; i++) i];
//                         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  var list3 = const [for (var i = 1; i < 4; i++) i];
//                   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  var list4 = const <int>[for (var i = 1; i < 4; i++) i];
//                        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  const list5 = [for (var i = 1; i < 4; i++) i];
//               ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  List<int> list6 = const [for (var i in [1, 2, 3]) i];
//                         ^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] COMPILE_TIME_ERROR.NON_CONSTANT_LIST_ELEMENT
// [cfe] 'for' is not supported in constant expressions.
  const List<int> list7 = [for (var i in [1, 2, 3]) i];
//                         ^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  var list8 = const [for (var i in [1, 2, 3]) i];
//                   ^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] COMPILE_TIME_ERROR.NON_CONSTANT_LIST_ELEMENT
// [cfe] 'for' is not supported in constant expressions.
  var list9 = const <int>[for (var i in [1, 2, 3]) i];
//                        ^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] COMPILE_TIME_ERROR.NON_CONSTANT_LIST_ELEMENT
// [cfe] 'for' is not supported in constant expressions.
  const list10 = [for (var i in [1, 2, 3]) i];
//                ^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  Set<int> set1 = const {for (var i = 1; i < 4; i++) i};
//                       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  const Set<int> set2 = {for (var i = 1; i < 4; i++) i};
//                       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  var set3 = const {for (var i = 1; i < 4; i++) i};
//                  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  var set4 = const <int>{for (var i = 1; i < 4; i++) i};
//                       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  const set5 = {for (var i = 1; i < 4; i++) i};
//              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  Set<int> set6 = const {for (var i in [1, 2, 3]) i};
//                       ^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] COMPILE_TIME_ERROR.NON_CONSTANT_SET_ELEMENT
// [cfe] 'for' is not supported in constant expressions.
  const Set<int> set7 = {for (for (var i in [1, 2, 3]) i};
//                       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  var set8 = const {for (for (var i in [1, 2, 3]) i};
//                  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  var set9 = const <int>{for (for (var i in [1, 2, 3]) i};
//                       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  const set10 = {for (for (var i in [1, 2, 3]) i};
//               ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  Map<int, String> map1 = const {for (var i = 1; i < 4; i++) i: "x"};
//                               ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  const Map<int, String> map2 = {for (var i = 1; i < 4; i++) i: "x"};
//                               ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  var map3 = const {for (var i = 1; i < 4; i++) i: i};
//                  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  var map4 = const <int, String>{for (var i = 1; i < 4; i++) i: "x"};
//                               ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  const map5 = {for (var i = 1; i < 4; i++) i: i};
//              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  Map<int, String> map6 = const {for (var i in [1, 2, 3]) i: "x"};
//                               ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  const Map<int, String> map7 = {for (var i in [1, 2, 3]) i: "x"};
//                               ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  var map8 = const {for (var i in [1, 2, 3]) i: i};
//                  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  var map9 = const <int, String>{for (var i in [1, 2, 3]) i: "x"};
//                               ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  const map10 = {for (var i in [1, 2, 3]) i: i};
//               ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
