/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion  It is a compile-time error if any two of the values are equal
 * according to ==.
 *
 * @description Checks that it is a compile-time error if any two of the values
 * are equal according to ==.
 * @author sgrekhov@unipro.ru
 */
main() {
  var v1 = const {1, 2 + 1, 3 - 1, 1};              //# 01: compile-time error
  const v2 = {1, 2 + 1, 3 - 1, 1, };                //# 02: compile-time error
  var v3 = const <int>{1 + 1, 2 + 1, 3 - 1, 1, };   //# 03: compile-time error

  const v4 = {null, null};                          //# 04: compile-time error
  var v5 = const {null, null};                      //# 05: compile-time error
  var v6 = const <int>{null, null};                 //# 06: compile-time error

  const v7 = {'1', '2' + '1', "3 - 1", "1",};             //# 07: compile-time error
  const v8 = {'1', '2' + '1', "3 - 1", true, 1 == 1};     //# 08: compile-time error
  var v9 = const {'1', '2' + '1', "3 - 1", true, 1 == 1}; //# 09: compile-time error
}
