/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a static error if:
 *    A spread element in a list or set literal has a static type that is not
 *    assignable to Iterable<Object>.
 * @description Checks that compile error is thrown if spread element in list
 * literal is not assignable to [Iterate<Object>]
 * @author iarkh@unipro.ru
 */

main() {
  var number = 1;
  var str = "checkme";
  var map = {1: 1, 2: 2};
  var list = [1, 2, 3, 4, 5];

  List l1 = [...number];   //# 01: compile-time error
  List l2 = [...str];      //# 02: compile-time error
  List l3 = [...map];      //# 03: compile-time error
  List l4 = [...list[0]];  //# 04: compile-time error

  List l5 = [...?number];  //# 05: compile-time error
  List l6 = [...?str];     //# 06: compile-time error
  List l7 = [...?map];     //# 07: compile-time error
  List l8 = [...?list[0]]; //# 08: compile-time error
}
