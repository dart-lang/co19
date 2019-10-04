/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Let e be a setOrMapLiteral
 * ...
 * If e has typeArguments then:
 *   - If there is exactly one type argument T, then e is a set literal with
 *     static type Set<T>.
 *   - If there are exactly two type arguments K and V, then e is a map literal
 *     with static type Map<K, V>.
 *   - Otherwise (three or more type arguments), report a compile-time error.
 *
 * @description Checks that it is a compile-time error if a mapLiteral has a
 * typeArguments with a number of type arguments other than two.
 * @author sgrekhov@unipro.ru
 */
Map map1 = {"1" :1, "2": 2};
Map map2 = {};

Map v1 = <int> {};                        //# 01: compile-time error
Map v2 = const <String> {};               //# 02: compile-time error
var v3 = <int> {1: 2};                    //# 03: compile-time error
var v4 = const <String> {'s': null};      //# 04: compile-time error
var v5 = const <String, int, int> {'s': null};  //# 05: compile-time error
var v6 = <String, int, int> {'s': null};        //# 06: compile-time error
var v7 = <String, int, int> {};           //# 07: compile-time error
var v8 = <String, int, int> {};           //# 08: compile-time error
var v9 = <String, int, int> {...map1};    //# 09: compile-time error
var v10 = <String, int, int> {...map2};   //# 10: compile-time error

main() {
  Map x1 = <int> {};                      //# 11: compile-time error
  Map x2 = const <String> {};             //# 12: compile-time error
  var x3 = <int> {1: 2};                  //# 13: compile-time error
  var x4 = const <String> {'s': null};    //# 14: compile-time error
  var x5 = const <String, int, int> {'s': null};  //# 15: compile-time error
  var x6 = <String, int, int> {'s': null};        //# 16: compile-time error
  var x7 = <String, int, int> {};         //# 17: compile-time error
  var x8 = <String, int, int> {};         //# 18: compile-time error
  var x9 = <String, int, int> {...map};   //# 19: compile-time error
  var x10 = <String, int, int> {...map2}; //# 20: compile-time error
}
