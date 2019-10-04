/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion In a constant map, a spread element expands to the series of
 * entries contained in the spread object map.
 * @author iarkh@unipro.ru
 */

import "../../Utils/expect.dart";

main() {
  const map1 = {1: 2, 13: 7, 9: 19};
  const map2 = {11: "checkme"};
  const map3 = {};
  const map4 = null;

  const Map res1 = {...map1};
  Expect.mapEquals(map1, res1);
  const Map res2 = <int, int>{...?map1};
  Expect.mapEquals(map1, res2);

  const Map res3 = <int, String>{...map2};
  Expect.mapEquals(map2, res3);
  const Map res4 = {...?map2};
  Expect.mapEquals(map2, res4);

  const Map res5 = {...map3};
  Expect.mapEquals(map3, res5);
  const Map res6 = {...?map3};
  Expect.mapEquals(map3, res6);

  const Map res7 = {...?map4};
  Expect.mapEquals({}, res7);

  const Map res8 = {100: null, 10: 14, ...map1, 6: 16};
  Expect.mapEquals({100: null, 10: 14, 1: 2, 13: 7, 9: 19, 6: 16}, res8);

  const Map res9 = {15: 15, ...map1, "stop": null, ...map2, ...map3, "a": "a",
      "b": "b", "c": "c", ...?map4, 208: 18};
  Expect.mapEquals({15: 15, 1: 2, 13: 7, 9: 19, "stop": null, 11: "checkme",
      "a": "a", "b": "b", "c": "c", 208: 18}, res9);
}
