/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Dynamic Semantics
 * The new dynamic semantics are a superset of the original behavior. To avoid
 * redundancy and handle nested uses, the semantics are expressed in terms of a
 * separate procedure below:
 * . . .
 * Maps
 * A map literal of the form [<K, V>{entry_1 ... entry_n}] is evaluated as
 * follows:
 * 1. Allocate a fresh instance [map] of a class that implements
 *    [LinkedHashMap<K, V>].
 *
 * 2. For each [element] in the map literal:
 *     i. Evaluate [element] using the procedure below.
 *
 * 3. The result of the map literal expression is [map].
 * . . .
 * To evaluate a collection [element]:
 * This procedure handles elements in both list and map literals because the
 * only difference is how a base expression element or entry element is handled.
 * The control flow parts are the same so are unified here.
 *
 * 1. If [element] is an [if] element:
 *
 *       i. Evaluate the condition expression to a value [condition].
 *      ii. Subject [condition] to boolean conversion to a value [result].
 *     iii. If [result] is [true]:
 *            a. Evaluate the "then" element using this procedure.
 *      iv. Else, if there is an "else" element of the [if]:
 *            a. Evaluate the "else" element using this procedure.
 * . . .
 * @description Checks that if [element] of map literal is an [if] element, this
 * element is evaluated using the specified procedure.
 * @author ngl@unipro.ru
 */
import "../../Utils/expect.dart";

main() {
  const t = false;
  const int x = 1;

  var map1exp = <int, String>{};
  if (t) {
    map1exp[x - 1] = "0";
  } else {
    map1exp[x + 10] = "11";
  }
  if (!t) {
    map1exp[x - 1] = "0";
  } else {
    map1exp[x + 10] = "11";
  }
  Expect.isTrue(map1exp is Map<int, String>);

  var map1 = <int, String>{
    if (t) x - 1: "0" else x + 10: "11",
    if (!t) x - 1: "0" else x + 10: "11"
  };
  // map1exp {11: 11, 0: 0}
  Expect.mapEquals(map1exp, map1);
  Expect.isTrue(map1 is Map<int, String>);

  var map2exp = <int, String>{};
  if (t) {
    map2exp[x - 1] = "0";
  } else {
    map2exp[x + 10] = "11";
  }
  if (!t) {
    if (t) {
      map2exp[x - 1] = "0";
    } else {
      map2exp[x + 11] = "12";
    }
  } else {
    map2exp[x + 10] = "11";
  }
  Expect.isTrue(map2exp is Map<int, String>);

  var map2 = <int, String>{
    if (t) x - 1: "0" else x + 10: "11",
    if (!t) if (t) x - 1: "0" else x + 11: "12" else x + 10: "11"
  };
  // map2exp {11: 11, 12: 12}
  Expect.mapEquals(map2exp, map2);
  Expect.isTrue(map2 is Map<int, String>);

  var map3exp = <int, String>{};
  if (t) {
    map3exp[x - 1] = "0";
  } else {
    if (!t) {
      map3exp[x + 1] = "2";
    } else {
      map3exp[x + 10] = "11";
    }
  }
  if (!t) {
    map3exp[x - 1] = "0";
  } else {
    map3exp[x + 10] = "11";
  }
  Expect.isTrue(map3exp is Map<int, String>);

  var map3 = <int, String>{
    if (t) x - 1: "0" else if (!t) x + 1: "2" else x + 10: "11",
    if (!t) x - 1: "0" else x + 10: "11"
  };
  // map3exp {2: 2, 0: 0}
  Expect.mapEquals(map3exp, map3);
  Expect.isTrue(map3 is Map<int, String>);
}
