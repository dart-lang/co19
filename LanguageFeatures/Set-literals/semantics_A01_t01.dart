/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile-time error if a mapLiteral has a typeArguments
 * with a number of type arguments other than two.
 *
 * @description Checks that it is a compile-time error if a mapLiteral has a
 * typeArguments with a number of type arguments other than two.
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=set-literals
Map v1 = <int> {};                      //# 01: compile-time error
Map v2 = const <String> {};             //# 02: compile-time error
var v3 = <int> {1: 2};                  //# 03: compile-time error
var v4 = const <String> {'s': null};    //# 04: compile-time error
var v5 = const <String, int, int> {'s': null};  //# 05: compile-time error
var v6 = <String, int, int> {'s': null};        //# 06: compile-time error
var v7 = <String, int, int> {};    //# 07: compile-time error
var v8 = <String, int, int> {};    //# 08: compile-time error

main() {
  Map x1 = <int> {};                      //# 09: compile-time error
  Map x2 = const <String> {};             //# 10: compile-time error
  var x3 = <int> {1: 2};                  //# 11: compile-time error
  var x4 = const <String> {'s': null};    //# 12: compile-time error
  var x5 = const <String, int, int> {'s': null};  //# 13: compile-time error
  var x6 = <String, int, int> {'s': null};        //# 14: compile-time error
  var x7 = <String, int, int> {};    //# 15: compile-time error
  var x8 = <String, int, int> {};    //# 16: compile-time error
}
