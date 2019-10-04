/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A for element:
 *
 * These are disallowed in constant collections
 *
 * @description Checks that a 'for' element is disallowed in a constant
 * collections
 * @author sgrekhov@unipro.ru
 */

main() {
  List<int> list1 = const [for (var i = 1; i < 4; i++) i]; //# 01: compile-time error
  const List<int> list2 = [for (var i = 1; i < 4; i++) i]; //# 02: compile-time error
  var list3 = const [for (var i = 1; i < 4; i++) i];       //# 03: compile-time error
  var list4 = const <int>[for (var i = 1; i < 4; i++) i];  //# 04: compile-time error
  const list5 = [for (var i = 1; i < 4; i++) i];           //# 05: compile-time error
  List<int> list6 = const [for (var i in [1, 2, 3]) i];    //# 06: compile-time error
  const List<int> list7 = [for (var i in [1, 2, 3]) i];    //# 07: compile-time error
  var list8 = const [for (var i in [1, 2, 3]) i];          //# 08: compile-time error
  var list9 = const <int>[for (var i in [1, 2, 3]) i];     //# 09: compile-time error
  const list10 = [for (var i in [1, 2, 3]) i];             //# 10: compile-time error

  Set<int> set1 = const {for (var i = 1; i < 4; i++) i};   //# 11: compile-time error
  const Set<int> set2 = {for (var i = 1; i < 4; i++) i};   //# 12: compile-time error
  var set3 = const {for (var i = 1; i < 4; i++) i};        //# 13: compile-time error
  var set4 = const <int>{for (var i = 1; i < 4; i++) i};   //# 14: compile-time error
  const set5 = {for (var i = 1; i < 4; i++) i};            //# 15: compile-time error
  Set<int> set6 = const {for (var i in [1, 2, 3]) i};      //# 16: compile-time error
  const Set<int> set7 = {for (for (var i in [1, 2, 3]) i}; //# 17: compile-time error
  var set8 = const {for (for (var i in [1, 2, 3]) i};      //# 18: compile-time error
  var set9 = const <int>{for (for (var i in [1, 2, 3]) i}; //# 19: compile-time error
  const set10 = {for (for (var i in [1, 2, 3]) i};         //# 20: compile-time error

  Map<int, String> map1 = const {for (var i = 1; i < 4; i++) i: "x"}; //# 21: compile-time error
  const Map<int, String> map2 = {for (var i = 1; i < 4; i++) i: "x"}; //# 22: compile-time error
  var map3 = const {for (var i = 1; i < 4; i++) i: i};                //# 23: compile-time error
  var map4 = const <int, String>{for (var i = 1; i < 4; i++) i: "x"}; //# 24: compile-time error
  const map5 = {for (var i = 1; i < 4; i++) i: i};                    //# 25: compile-time error
  Map<int, String> map6 = const {for (var i in [1, 2, 3]) i: "x"};    //# 26: compile-time error
  const Map<int, String> map7 = {for (var i in [1, 2, 3]) i: "x"};    //# 27: compile-time error
  var map8 = const {for (var i in [1, 2, 3]) i: i};                   //# 28: compile-time error
  var map9 = const <int, String>{for (var i in [1, 2, 3]) i: "x"};    //# 29: compile-time error
  const map10 = {for (var i in [1, 2, 3]) i: i};                      //# 30: compile-time error

}
