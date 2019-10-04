/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A map literal of the form [<K, V>{entry_1 ... entry_n}] is
 * evaluated as follows:
 *
 *   1. Allocate a fresh instance [map] of a class that implements
 *     [LinkedHashMap<K, V>].
 *     ...
 *   3. The result of the map literal expression is [map].
 * @description Checks that instance of [LinkedHashMap<K, V>] is created for a
 * map literal
 * @author iarkh@unipro.ru
 */

import "dart:collection";
import "../../Utils/expect.dart";

main() {
  Map map1 = {1: 1, 2: 2, 3: 3, 4: 4, 5: 5};
  Map map2 = {};
  Map map3 = null;
  Map map4 = {1: "a", 2: "2", 3: "three", 4: "checkme"};

  Expect.isTrue(<int, int>{...map1} is LinkedHashMap<int, int>);
  Expect.isTrue(<int, Object>{...map1} is LinkedHashMap<int, Object>);
  Expect.isTrue(<Object, Object>{...map1} is LinkedHashMap<Object, Object>);
  Expect.isTrue(
      <int, Object>{1: "a", 2: "b", ...map1} is LinkedHashMap<int, Object>);
  Expect.isTrue(
      <int, num>{1: 0, ...?map1, 14: 6, 9: 9} is LinkedHashMap<int, num>);
  Expect.isTrue(<int, String>{...map2, 1: "123"} is LinkedHashMap<int, String>);
  Expect.isTrue(<int, String>{...?map2} is LinkedHashMap<int, String>);
  Expect.isTrue(<int, String>{...map2} is LinkedHashMap<int, String>);
  Expect.isTrue(
      <int, String>{...?map3, 1: "123"} is LinkedHashMap<int, String>);
  Expect.isTrue(<int, String>{...?map3} is LinkedHashMap<int, String>);
  Expect.isTrue({...map4} is LinkedHashMap<Object, Object>);
}
