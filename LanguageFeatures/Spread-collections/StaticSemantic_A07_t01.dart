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

  Map m1 = <Object, Object> {};
  Map<int, String> m2 = <int, String>{};
  Map m3 = <Object, Object> {1: "1", 2: "2"};
  Map<int, String> m4 = <int, String>{1: "11"};

  Map map1 = <int, String>{...m1};
  Map map2 = <int, String>{...m2};
  Map map3 = <int, String>{...m3};
  Map map4 = <int, String>{...m4};

  Map map5 = <int, String>{...?m1};
  Map map6 = <int, String>{...?m2};
  Map map7 = <int, String>{...?m3};
  Map map8 = <int, String>{...?m4};
}
