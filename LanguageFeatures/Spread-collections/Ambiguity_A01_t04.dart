/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion An expression like:
 *   { ...a, ...b }
 * Is syntactically parsed as [mapOrSetLiteral]. To determine whether it
 * actually is a map or set, the surrounding context is used. Given an
 * [mapOrSetLiteral] with context type [C]:
 *
 * If [Set<Null>] is assignable to [C], and [Map<Null, Null>] is not
 * assignable to [C], then the collection is a set literal.
 *
 * Otherwise, it is a map literal.
 *
 * In other words, if it can only be a set, it is. Otherwise, it's a map.
 * @description Checks that if [a] and [b] are map literals (probably,
 * null-aware), their spread is a map.
 * @author iarkh@unipro.ru
 */

import "../../Utils/expect.dart";

main() {
  var map1 = {1: 1, "test": 1, 14: null};
  var map2 = null;
  var map3 = <String, bool>{};
  var map4 = <bool, String>{true: "true", false: "false"};

  Map res1 = {...map1, ...?map2};
  Expect.mapEquals(map1, res1);

  Map res2 = {...?map2, ...map3};
  Expect.mapEquals(map3, res2);

  Map res3 = {...?map2, ...map4};
  Expect.mapEquals(map4, res3);

  Map res4 = {...?map1, ...?map2};
  Expect.mapEquals(map1, res4);

  Map res5 = {...?map2, ...?map3};
  Expect.mapEquals(map3, res5);

  Map res6 = {...?map2, ...?map4};
  Expect.mapEquals(map4, res6);

  Map res7 = {...?map1, ...?map2, ...?map3, ...?map4};
  Expect.mapEquals(
      {1: 1, "test": 1, 14: null, true: "true", false: "false"}, res7);
}
