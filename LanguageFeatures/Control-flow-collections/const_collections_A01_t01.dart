/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion An expression element (the base case in lists and sets):
 *
 *  It is a compile-time error if the expression is not a constant expression.
 *  The expansion is the value of the expression.
 *
 * @description Checks that it is a compile-time error if the expression is not
 * a constant expression
 * @author sgrekhov@unipro.ru
 */

main() {
  var x = 1;
  List<int> list1 = const [if (1 > 0) x, 1 ];         //# 01: compile-time error
  const List<int> list2 = [if (1 > 0) x, 1 ];         //# 02: compile-time error
  var list3 = const [if (1 > 0) x, 1, ];              //# 03: compile-time error
  var list4 = const <int>[if (1 > 0) x, 1, ];         //# 04: compile-time error
  const list5 = [if (1 > 0) x, 1 ];                   //# 05: compile-time error

  Set<int> set1 = const {if (1 > 0) x, -1 };          //# 06: compile-time error
  const Set<int> set2 = {if (1 > 0) x, -1 };          //# 07: compile-time error
  var set3 = const {if (1 > 0) x, -1, };              //# 08: compile-time error
  var set4 = const <int>{if (1 > 0) x, -1, };         //# 09: compile-time error
  const set5 = {if (1 > 0) x, -1 };                   //# 10: compile-time error
}
