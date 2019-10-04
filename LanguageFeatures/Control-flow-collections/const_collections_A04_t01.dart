/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion An if element:
 * ...
 * It is a compile-time error if the then and else branches are not potentially
 * const expressions. The "potentially const" is to allow a the unchosen branch
 * to throw an exception. In other words, if elements short-circuit.
 *
 * @description Checks that it is a compile-time error if the then and else
 * branches are not potentially const expressions.
 * @author sgrekhov@unipro.ru
 */
main() {
  const t = true;
  var x = 1;
  List<int> list1 = const [if (t) x else 1 ];         //# 01: compile-time error
  const List<int> list2 = [if (!t) 1 else x ];        //# 02: compile-time error
  var list3 = const [if (t) x else 1, ];              //# 03: compile-time error
  var list4 = const <int>[if (!t) 1 else x, ];        //# 04: compile-time error
  const list5 = [if (t) 1 else x ];                   //# 05: compile-time error

  Set<int> set1 = const {if (t) x else 1, -1 };       //# 06: compile-time error
  const Set<int> set2 = {if (!t) 1 else x, -1 };      //# 07: compile-time error
  var set3 = const {if (t) x else 1, -1, };           //# 08: compile-time error
  var set4 = const <int>{if (!t) 1 else x, -1, };     //# 09: compile-time error
  const set5 = {if (!t) 1 else x, -1 };               //# 10: compile-time error

  Map<int, String> map1 = const {if (!t) 1: "1" else x: "1"};   //# 11: compile-time error
  const Map<int, String> map2 = {if (t) x: "x" else 1: "x"};    //# 12: compile-time error
  var map3 = const {if (!t) 1: "x" else x: "x"};                //# 13: compile-time error
  var map4 = const <int, String>{if (!t) 1: "x" else x: "x"};   //# 14: compile-time error
  const map5 = {if (!t) 1: "x" else x: "x"};                    //# 15: compile-time error
}
