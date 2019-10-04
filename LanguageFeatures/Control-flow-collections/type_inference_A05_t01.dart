/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If a map literal has a downwards inference type of Map<K, V> for
 * some K and V, then the downwards inference context type of the keys in the
 * body elements is K and the values is V.
 *
 * @description Checks that if a map literal has a downwards inference type of
 * Map<K, V> for some K and V, then the downwards inference context type of the
 * keys in the body elements is K and the values is V.
 * @author sgrekhov@unipro.ru
 */
import "../../Utils/expect.dart";

main() {
  Map<num, List<int>> map1 = {
    if (true) 11: [],
    if (false) 1: [] else 22: [],
    for (var i = 0; i < 1; i++) i: []
  };
  Expect.isTrue(map1 is Map<num, List<int>>);
  Expect.isFalse(map1 is Map<int, List<int>>);
  Expect.mapEquals({11: [], 22: [], 0: []}, map1);

  var map2 = <num, List<int>> {
    if (true) 11: [],
    if (false) 1: [] else 22: [],
    for (var i = 0; i < 1; i++) i: []
  };
  Expect.isTrue(map2 is Map<num, List<int>>);
  Expect.isFalse(map2 is Map<int, List<int>>);
  Expect.mapEquals({11: [], 22: [], 0: []}, map2);

  var map3 = const <num, List<int>> {
    if (true) 1: [],
    if (false) 2: [] else 3: [],
  };
  Expect.isTrue(map3 is Map<num, List<int>>);
  Expect.isFalse(map2 is Map<int, List<int>>);
  Expect.mapEquals({1: [], 3: []}, map3);

  const map4 = <num, List<int>> {
    if (true) 1: [],
    if (false) 2: [] else 3: [],
  };
  Expect.isTrue(map4 is Map<num, List<int>>);
  Expect.isFalse(map4 is Map<int, List<int>>);
  Expect.mapEquals({1: [], 3: []}, map4);
}
