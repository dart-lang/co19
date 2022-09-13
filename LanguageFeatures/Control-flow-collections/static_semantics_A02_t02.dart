// Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Let the key type and value type of a map literal be the
/// corresponding static types of the type arguments for a map literal.
/// So <int, String>{} and {1: "s"} both have a key type of int and a value type
/// of String
///
/// @description Checks that element type of the map literals is the static type
/// of the type argument used to create the map
/// @author sgrekhov@unipro.ru


main() {
  bool b = true;
  var collection = [3, 1, 4, 1, 5];

  Map<String, int> map1 = {if (b) "1": 1.1};
//                                     ^^^
// [analyzer] COMPILE_TIME_ERROR.MAP_VALUE_TYPE_NOT_ASSIGNABLE
// [cfe] A value of type 'double' can't be assigned to a variable of type 'int'.
  Map<String, int> map2 = {if (b) 1: 1};
//                                ^
// [analyzer] COMPILE_TIME_ERROR.MAP_KEY_TYPE_NOT_ASSIGNABLE
// [cfe] A value of type 'int' can't be assigned to a variable of type 'String'.
  Map<String, int> map3 = {if (!b) "1": 1.1,};
//                                      ^^^
// [analyzer] COMPILE_TIME_ERROR.MAP_VALUE_TYPE_NOT_ASSIGNABLE
// [cfe] A value of type 'double' can't be assigned to a variable of type 'int'.
  Map<String, int> map4 = {if (!b) 1: 1};
//                                 ^
// [analyzer] COMPILE_TIME_ERROR.MAP_KEY_TYPE_NOT_ASSIGNABLE
// [cfe] A value of type 'int' can't be assigned to a variable of type 'String'.
  Map<String, int> map5 = {if (b) for (var v in collection) if (v > 3) "$v": "$v",};
//                                                                           ^^^^
// [analyzer] COMPILE_TIME_ERROR.MAP_VALUE_TYPE_NOT_ASSIGNABLE
//                                                                               ^
// [cfe] A value of type 'String' can't be assigned to a variable of type 'int'.
  Map<String, int> map6 = {if (b) for (var v in collection) if (v > 3) v: v,};
//                                                                     ^
// [analyzer] COMPILE_TIME_ERROR.MAP_KEY_TYPE_NOT_ASSIGNABLE
// [cfe] A value of type 'int' can't be assigned to a variable of type 'String'.
  Map<String, int> map7 = {if (!b) for (var v in collection) if (v > 3) "$v": "$v"};
//                                                                            ^^^^
// [analyzer] COMPILE_TIME_ERROR.MAP_VALUE_TYPE_NOT_ASSIGNABLE
//                                                                                ^
// [cfe] A value of type 'String' can't be assigned to a variable of type 'int'.
  Map<String, int> map8 = {if (!b) for (var v in collection) if (v > 3) v: v,};
//                                                                      ^
// [analyzer] COMPILE_TIME_ERROR.MAP_KEY_TYPE_NOT_ASSIGNABLE
// [cfe] A value of type 'int' can't be assigned to a variable of type 'String'.

  Map map9  = <String, int>{if (b) "1": 1.1};
//                                      ^^^
// [analyzer] COMPILE_TIME_ERROR.MAP_VALUE_TYPE_NOT_ASSIGNABLE
// [cfe] A value of type 'double' can't be assigned to a variable of type 'int'.
  Map map10 = <String, int>{if (b) 1: 1};
//                                 ^
// [analyzer] COMPILE_TIME_ERROR.MAP_KEY_TYPE_NOT_ASSIGNABLE
// [cfe] A value of type 'int' can't be assigned to a variable of type 'String'.
  Map map11 = <String, int>{if (!b) "1": 1.1,};
//                                       ^^^
// [analyzer] COMPILE_TIME_ERROR.MAP_VALUE_TYPE_NOT_ASSIGNABLE
// [cfe] A value of type 'double' can't be assigned to a variable of type 'int'.
  Map map12 = <String, int>{if (!b) 1: 1};
//                                  ^
// [analyzer] COMPILE_TIME_ERROR.MAP_KEY_TYPE_NOT_ASSIGNABLE
// [cfe] A value of type 'int' can't be assigned to a variable of type 'String'.
  Map map13 = <String, int>{if (b) for (var v in collection) if (v > 3) "$v": "$v",};
//                                                                            ^^^^
// [analyzer] COMPILE_TIME_ERROR.MAP_VALUE_TYPE_NOT_ASSIGNABLE
//                                                                                ^
// [cfe] A value of type 'String' can't be assigned to a variable of type 'int'.
  Map map14 = <String, int>{if (b) for (var v in collection) if (v > 3) v: v,};
//                                                                      ^
// [analyzer] COMPILE_TIME_ERROR.MAP_KEY_TYPE_NOT_ASSIGNABLE
// [cfe] A value of type 'int' can't be assigned to a variable of type 'String'.
  Map map15 = <String, int>{if (!b) for (var v in collection) if (v > 3) "$v": "$v"};
//                                                                             ^^^^
// [analyzer] COMPILE_TIME_ERROR.MAP_VALUE_TYPE_NOT_ASSIGNABLE
//                                                                                 ^
// [cfe] A value of type 'String' can't be assigned to a variable of type 'int'.
  Map map16 = <String, int>{if (!b) for (var v in collection) if (v > 3) v: v,};
//                                                                       ^
// [analyzer] COMPILE_TIME_ERROR.MAP_KEY_TYPE_NOT_ASSIGNABLE
// [cfe] A value of type 'int' can't be assigned to a variable of type 'String'.

  const map17 = <String, int>{if (1 > 2) "1": 1.1};
//                                            ^^^
// [analyzer] COMPILE_TIME_ERROR.MAP_VALUE_TYPE_NOT_ASSIGNABLE
// [cfe] A value of type 'double' can't be assigned to a variable of type 'int'.
  const map18 = <String, int>{if (2 > 1) "1": 1.1,};
//                                            ^^^
// [analyzer] COMPILE_TIME_ERROR.MAP_VALUE_TYPE_NOT_ASSIGNABLE
// [cfe] A value of type 'double' can't be assigned to a variable of type 'int'.
  const map19 = <String, int>{if (1 > 2) 1: 1};
//                                       ^
// [analyzer] COMPILE_TIME_ERROR.MAP_KEY_TYPE_NOT_ASSIGNABLE
// [cfe] A value of type 'int' can't be assigned to a variable of type 'String'.
  const map20 = <String, int>{if (2 > 1) 1: 1,};
//                                       ^
// [analyzer] COMPILE_TIME_ERROR.MAP_KEY_TYPE_NOT_ASSIGNABLE
// [cfe] A value of type 'int' can't be assigned to a variable of type 'String'.

  var map21 = const <String, int>{if (1 > 2) "1": 1.1};
//                                                ^^^
// [analyzer] COMPILE_TIME_ERROR.MAP_VALUE_TYPE_NOT_ASSIGNABLE
// [cfe] A value of type 'double' can't be assigned to a variable of type 'int'.
  var map22 = const <String, int>{if (2 > 1) "1": 1.1,};
//                                                ^^^
// [analyzer] COMPILE_TIME_ERROR.MAP_VALUE_TYPE_NOT_ASSIGNABLE
// [cfe] A value of type 'double' can't be assigned to a variable of type 'int'.
  var map23 = const <String, int>{if (1 > 2) 1: 1};
//                                           ^
// [analyzer] COMPILE_TIME_ERROR.MAP_KEY_TYPE_NOT_ASSIGNABLE
// [cfe] A value of type 'int' can't be assigned to a variable of type 'String'.
  var map24 = const <String, int>{if (2 > 1) 1: 1,};
//                                           ^
// [analyzer] COMPILE_TIME_ERROR.MAP_KEY_TYPE_NOT_ASSIGNABLE
// [cfe] A value of type 'int' can't be assigned to a variable of type 'String'.
}
