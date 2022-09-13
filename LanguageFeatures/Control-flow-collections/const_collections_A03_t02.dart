// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An if element:
/// It is a compile-time error if the condition expression is not constant or
/// does not evaluate to true or false.
///
/// @description Checks that it is a compile-time error if the condition
/// expression does not evaluate to true or false
/// @author sgrekhov@unipro.ru

main() {
  var x = 1;
  List<int> list1 = const [if (1) 1, 1 ];
//                             ^
// [analyzer] COMPILE_TIME_ERROR.NON_BOOL_CONDITION
// [cfe] A value of type 'int' can't be assigned to a variable of type 'bool'.
  const List<int> list2 = [if (0) 1, 1 ];
//                             ^
// [analyzer] COMPILE_TIME_ERROR.NON_BOOL_CONDITION
// [cfe] A value of type 'int' can't be assigned to a variable of type 'bool'.
  var list3 = const [if ("s") 1, 1, ];
//                       ^^^
// [analyzer] COMPILE_TIME_ERROR.NON_BOOL_CONDITION
// [cfe] A value of type 'String' can't be assigned to a variable of type 'bool'.
  var list4 = const <int>[if (0) 1, 1, ];
//                            ^
// [analyzer] COMPILE_TIME_ERROR.NON_BOOL_CONDITION
// [cfe] A value of type 'int' can't be assigned to a variable of type 'bool'.
  const list5 = [if (0) 1, 1 ];
//                   ^
// [analyzer] COMPILE_TIME_ERROR.NON_BOOL_CONDITION
// [cfe] A value of type 'int' can't be assigned to a variable of type 'bool'.

  Set<int> set1 = const {if (0) 1, -1 };
//                           ^
// [analyzer] COMPILE_TIME_ERROR.NON_BOOL_CONDITION
// [cfe] A value of type 'int' can't be assigned to a variable of type 'bool'.
  const Set<int> set2 = {if (1) 1, -1 };
//                           ^
// [analyzer] COMPILE_TIME_ERROR.NON_BOOL_CONDITION
// [cfe] A value of type 'int' can't be assigned to a variable of type 'bool'.
  var set3 = const {if ("s") 1, -1, };
//                      ^^^
// [analyzer] COMPILE_TIME_ERROR.NON_BOOL_CONDITION
// [cfe] A value of type 'String' can't be assigned to a variable of type 'bool'.
  var set4 = const <int>{if (0) 1, -1, };
//                           ^
// [analyzer] COMPILE_TIME_ERROR.NON_BOOL_CONDITION
// [cfe] A value of type 'int' can't be assigned to a variable of type 'bool'.
  const set5 = {if (1) 1, -1 };
//                  ^
// [analyzer] COMPILE_TIME_ERROR.NON_BOOL_CONDITION
// [cfe] A value of type 'int' can't be assigned to a variable of type 'bool'.

  Map<int, String> map1 = const {if (0) 1: "1"};
//                                   ^
// [analyzer] COMPILE_TIME_ERROR.NON_BOOL_CONDITION
// [cfe] A value of type 'int' can't be assigned to a variable of type 'bool'.
  const Map<int, String> map2 = {if (1) 1: "x"};
//                                   ^
// [analyzer] COMPILE_TIME_ERROR.NON_BOOL_CONDITION
// [cfe] A value of type 'int' can't be assigned to a variable of type 'bool'.
  var map3 = const {if ("s") 1: "x"};
//                      ^^^
// [analyzer] COMPILE_TIME_ERROR.NON_BOOL_CONDITION
// [cfe] A value of type 'String' can't be assigned to a variable of type 'bool'.
  var map4 = const <int, String>{if (0) 1: "x"};
//                                   ^
// [analyzer] COMPILE_TIME_ERROR.NON_BOOL_CONDITION
// [cfe] A value of type 'int' can't be assigned to a variable of type 'bool'.
  const map5 = {if (0.0) 1: "x" };
//                  ^^^
// [analyzer] unspecified
// [cfe] unspecified
}
