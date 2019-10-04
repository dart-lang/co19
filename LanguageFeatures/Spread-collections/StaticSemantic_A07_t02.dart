/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a static error if:
 *    If a map spread element's static type implements [Map<K, V>] for some [K]
 *    and [V] and [K] is not assignable to the key type of the map or [V] is not
 *    assignable to the value type of the map.
 * @description Checks that compile error is thrown if spread element type in
 * map literal is not assignable to the type of the map.
 * @author iarkh@unipro.ru
 */

main() {
  Map<String, int> m1 = <String, int>{};
  Map<int, int> m2 = <int, int>{};
  Map<String, String> m3 = <String, String>{};
  Map<bool, bool> m4 = <bool, bool>{};
  Map<bool, bool> m5 = <bool, bool>{true: false, false: true};
  Map<String, int> m6 = <String, int>{"1": 11};
  Map<int, int> m7 = <int, int>{1: 22, 2: 13, 3: 4};
  Map<String, String> m8 = <String, String>{"1": "22", "2": "13", "3": "4"};

  Map map1  = <int, String>{...m1};  //# 01: compile-time error
  Map map2  = <int, String>{...m2};  //# 02: compile-time error
  Map map3  = <int, String>{...m3};  //# 03: compile-time error
  Map map4  = <int, String>{...m4};  //# 04: compile-time error
  Map map5  = <int, String>{...m5};  //# 05: compile-time error
  Map map6  = <int, String>{...m6};  //# 06: compile-time error
  Map map7  = <int, String>{...m7};  //# 07: compile-time error
  Map map8  = <int, String>{...m8};  //# 08: compile-time error

  Map map9  = <int, String>{...?m1}; //# 09: compile-time error
  Map map10 = <int, String>{...?m2}; //# 10: compile-time error
  Map map11 = <int, String>{...?m3}; //# 11: compile-time error
  Map map12 = <int, String>{...?m4}; //# 12: compile-time error
  Map map13 = <int, String>{...?m5}; //# 13: compile-time error
  Map map14 = <int, String>{...?m6}; //# 14: compile-time error
  Map map15 = <int, String>{...?m7}; //# 15: compile-time error
  Map map16 = <int, String>{...?m8}; //# 16: compile-time error
}
