/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion An if element:
 * It is a compile-time error if the condition expression is not constant or
 * does not evaluate to true or false.
 *
 * @description Checks that it is a compile-time error if the condition
 * expression does not evaluate to true or false
 * @author sgrekhov@unipro.ru
 */
main() {
  var x = 1;
  List<int> list1 = const [if (1) 1, 1 ];         //# 01: compile-time error
  const List<int> list2 = [if (0) 1, 1 ];         //# 02: compile-time error
  var list3 = const [if ("s") 1, 1, ];            //# 03: compile-time error
  var list4 = const <int>[if (0) 1, 1, ];         //# 04: compile-time error
  const list5 = [if (0) 1, 1 ];                   //# 05: compile-time error

  Set<int> set1 = const {if (0) 1, -1 };          //# 06: compile-time error
  const Set<int> set2 = {if (1) 1, -1 };          //# 07: compile-time error
  var set3 = const {if ("s") 1, -1, };            //# 08: compile-time error
  var set4 = const <int>{if (0) 1, -1, };         //# 09: compile-time error
  const set5 = {if (1) 1, -1 };                   //# 10: compile-time error

  Map<int, String> map1 = const {if (0) 1: "1"};  //# 11: compile-time error
  const Map<int, String> map2 = {if (1) 1: "x"};  //# 12: compile-time error
  var map3 = const {if ("s") 1: "x"};             //# 13: compile-time error
  var map4 = const <int, String>{if (0) 1: "x"};  //# 14: compile-time error
  const map5 = {if (0.0) 1: "x" };                //# 15: compile-time error
}
