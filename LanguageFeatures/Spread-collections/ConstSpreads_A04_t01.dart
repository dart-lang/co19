/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile-time error if any of the elements being spread in
 * a const set are equal to other elements in the set literal, in the spread, or
 * in other spreads in the same set, as in:
 *
 *   const list = [1, 2];
 *   const set = {1, ...list}; // Error because 1 is duplicated.
 *
 * @description Checks that elements cannot be duplicated in the constant set.
 * @author iarkh@unipro.ru
 */

main() {
  const list1 = [2, 7, 9];
  const list2 = [2, 12, 33];
  const list3 = [2, 12, 4, 12, 11, 0, 3];

  const res1 = {...list1, ...list2};                             //# 01: compile-time error
  const res2 = {1, 14, ...?list1, 99, ...list2};                 //# 02: compile-time error
  const res3 = {...list2, ...list1};                             //# 03: compile-time error
  const res4 = {...?list3};                                      //# 04: compile-time error
  const res5 = {...list3};                                       //# 05: compile-time error
  const res6 = {2, 4, ...?list1, 14};                            //# 06: compile-time error
  const res7 = {...?list2, 12, 33};                              //# 07: compile-time error
  const res8 = {1, 10, ...list1, 6, 9, 2};                       //# 08: compile-time error
  const res9 = {1, ...list1, ...list2, ...list3, ...?list4, 18}; //# 09: compile-time error
}
