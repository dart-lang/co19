/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A list literal <E>[elem_1 ... elem_n] is evaluated as follows:
 *
 * 2. For each entry in the map literal:
 *    i. If entry is a spread element:
 *       a. Evaluate the entry's expression to a value value.
 *       b. If entry is null-aware and value is [null], continue to the next
 *          entry in the literal.
 *       c. Evaluate [value.entries.iterator] to a value iterator.
 *       d. Loop:
 *          a. If [iterator.moveNext()] returns [false], exit the loop.
 *          b. Evaluate [iterator.current] to a value [newEntry].
 *          c. Call map[newEntry.key] = newEntry.value.
 *    ii. Else, entry has form [e1: e2]:
 *       a. Evaluate [e1] to a value key.
 *       b. Evaluate [e2] to a value value.
 *       c. Call map[key] = value.
 * @description Checks that if element is null-aware and it's [null], nothing
 * added to the result map.
 * @author iarkh@unipro.ru
 */

import "../../Utils/expect.dart";

main() {
  Map map1 = {1: 1, 2: 2, 3: 3, 4: 4, 5: 5};
  Map map2 = {};
  Map map3 = null;
  Map map4 = {1: 1, 2: 2, 3: 3, 4: "checkme"};

  Expect.mapEquals({}, {...?map3});
  Expect.mapEquals({1: 1, 2: 2, 4: 4}, {1: 1, 2: 2, ...?map3, 4: 4});

  Expect.mapEquals({}, <dynamic, dynamic>{...?null});
  Expect.mapEquals({4: 1, 3: 2, 2: 4}, {4: 1, 3: 2, ...?null, 2: 4});

  Expect.mapEquals({100: 14, 1: 1, 2: 2, 3: 3, 4: "checkme", 99: 99},
      {100: 14, ...?map4, ...?map3, 99: 99});

  Expect.mapEquals({}, {...?map3, ...?map3, ...?map3});
  Expect.mapEquals({}, {...map2, ...?map3});
}
