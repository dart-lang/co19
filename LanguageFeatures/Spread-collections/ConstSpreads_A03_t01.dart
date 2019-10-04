/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile-time error to use a spread element in a constant
 * list or set unless the spread object was created by a constant list or set
 * literal expression.
 * @description Checks that compile error is thrown if spread element is not a
 * constant list or set literal in the constant list
 * @author iarkh@unipro.ru
 */

main() {
  List list1 = [2, 7, 9];
  Set list2 = {"checkme"};
  List list3 = [];
  List list4 = null;

  const res1 = [...list1];                                       //# 01: compile-time error
  const res2 = [...?list1];                                      //# 02: compile-time error
  const res3 = [...list2];                                       //# 03: compile-time error
  const res4 = [...?list2];                                      //# 04: compile-time error
  const res5 = [...list3];                                       //# 05: compile-time error
  const res6 = [...?list3];                                      //# 06: compile-time error
  const res7 = [...?list4];                                      //# 07: compile-time error
  const res8 = [1, 2, ...list1, 6];                              //# 08: compile-time error
  const res9 = [1, ...list1, ...list2, ...list3, ...?list4, 18]; //# 09: compile-time error
}
