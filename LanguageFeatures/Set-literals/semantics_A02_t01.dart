/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile-time error if a setLiteral has a typeArguments
 * with more than one type argument.
 *
 * @description Checks that it is a compile-time error if a setLiteral has a
 * typeArguments with more than one type argument.
 * @author sgrekhov@unipro.ru
 */
var v1 = <int, String> {1};                  //# 01: compile-time error
var v2 = const <String, int> {1, 2};         //# 02: compile-time error
var v3 = <String, int> {'1', '2'};           //# 03: compile-time error
var v4 = const <int, String> {'s', null};    //# 04: compile-time error

main() {
  var x1 = <int, String> {1};                  //# 05: compile-time error
  var x2 = const <String, int> {1, 2};         //# 06: compile-time error
  var x3 = <String, int> {'1', '2'};           //# 07: compile-time error
  var x4 = const <int, String> {'s', null};    //# 08: compile-time error
}
