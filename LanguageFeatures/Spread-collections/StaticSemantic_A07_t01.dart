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
// SharedOptions=--enable-experiment=spread-collections,constant-update-2018

main() {

  Map m1  = <Object, Object> {};
  Map<int, String> m2  = <int, String>{};
  Map<String, int> m3 = <String, int>{};
  Map<int, int> m4  = <int, int>{};
  Map<String, String> m5  = <String, String>{};
  Map<bool, bool> m6  = <bool, bool>{};
  Map m7  = <Object, Object> {1: "1", 2: "2"};
  Map<bool, bool> m8 = <bool, bool>{true: false, false: true};

  Map<int, String> m9 = <int, String>{1: "11"};
  Map<String, int> m10 = <String, int>{"1": 11};
  Map<int, int> m11 = <int, int>{1: 22, 2: 13, 3: 4};
  Map<String, String> m12 = <String, String>{"1": "22", "2": "13", "3": "4"};


  Map map1 = <int, String>{...m1};
  Map map2 = <int, String>{...m2};
  Map map3 = <int, String>{...m3}; //# 01: compile-time error
  Map map4 = <int, String>{...m4}; //# 02: compile-time error
  Map map5 = <int, String>{...m5}; //# 03: compile-time error
  Map map6 = <int, String>{...m6}; //# 04: compile-time error
  Map map7 = <int, String>{...m7};
  Map map8 = <int, String>{...m8}; //# 05: compile-time error

  Map map9  = <int, String>{...m9};
  Map map10 = <int, String>{...m10}; //# 06: compile-time error
  Map map11 = <int, String>{...m11}; //# 07: compile-time error
  Map map12 = <int, String>{...m12}; //# 08: compile-time error
}
