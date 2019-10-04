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
 * @description Checks that it is a compile-time error if a setLiteral has a
 * typeArguments with more than one type argument.
 * @author sgrekhov@unipro.ru
 */
Set set1 = {1, 2};
Set set2 = {};

var v1 = <int, String> {1};                   //# 01: compile-time error
var v2 = const <String, int> {1, 2};          //# 02: compile-time error
var v3 = <String, int> {'1', '2'};            //# 03: compile-time error
var v4 = const <int, String> {'s', null};     //# 04: compile-time error
var v5 = <String, int> {...set1};             //# 05: compile-time error
var v6 = const <int, String> {...set2};       //# 06: compile-time error

main() {
  var x1 = <int, String> {1};                  //# 07: compile-time error
  var x2 = const <String, int> {1, 2};         //# 08: compile-time error
  var x3 = <String, int> {'1', '2'};           //# 09: compile-time error
  var x4 = const <int, String> {'s', null};    //# 10: compile-time error
  var x5 = <String, int> {...set1};            //# 11: compile-time error
  var x6 = const <int, String> {...set2};      //# 12: compile-time error
}
