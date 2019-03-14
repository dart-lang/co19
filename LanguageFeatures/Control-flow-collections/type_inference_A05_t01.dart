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
// SharedOptions=--enable-experiment=control-flow-collections
import "../../Utils/expect.dart";

main() {
  Map<List<String>, List<int>> map1 = {
    if (true) []: [],
    if (false) []: [] else ["2"]: [2],
    for (var i = 0; i < 1; i++) ["$i"]: [i]
  };
  Expect.isTrue(map1 is Map<List<String>, List<int>>);
  Expect.mapEquals({[]: [], ["2"]: [2], ["1"]: [1]}, map1);

  var map2 = <List<String>, List<int>> {
    if (true) []: [],
    if (false) []: [] else ["2"]: [2],
    for (var i = 0; i < 1; i++) ["$i"]: [i]
  };
  Expect.isTrue(map2 is Map<List<String>, List<int>>);
  Expect.mapEquals({[]: [], ["2"]: [2], ["1"]: [1]}, map2);

  var map3 = const <List<String>, List<int>> {
    if (true) []: [],
    if (false) []: [] else ["1"]: [2],
  };
  Expect.isTrue(map3 is Map<List<String>, List<int>>);
  Expect.mapEquals({[]: [], ["1"]: [2]}, map3);

  const map4 = <List<String>, List<int>> {
    if (true) []: [],
    if (false) []: [] else ["1"]: [2],
  };
  Expect.isTrue(map4 is Map<List<String>, List<int>>);
  Expect.mapEquals({[]: [], ["1"]: [2]}, map4);
}
