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
 * 2. Else, if [element] is a synchronous [for-in] element:
 *
 *      i. Evaluate the iterator expression to a value [sequence].
 *     ii. Evaluate [sequence.iterator] to a value [iterator].
 *    iii. Loop:
 *           a. If the boolean conversion of [iterator.moveNext()] does not
 *              return [true], exit the loop.
 *           b. If the [for-in] element declares a variable, create a fresh
 *              [variable] for it. Otherwise, use the existing [variable] it
 *              refers to.
 *           c. Evaluate [iterator.current] and bind it to [variable].
 *           d. Evaluate the body element using this procedure in the scope of
 *              [variable].
 *     iv. If the [for-in] element declares a variable, discard it.
 * . . .
 * @description Checks that if [element] of map literal is a synchronous
 * [for-in] element, this element is evaluated using the specified procedure.
 * @author ngl@unipro.ru
 */
import "../../Utils/expect.dart";

main() {
  var m2 = [MapEntry(1, 'a'), MapEntry(2, 'b'), MapEntry(3, 'c'),
    MapEntry(4, 'd'), MapEntry(5, 'e')];

  var map1exp = <int, String>{};
  var n0 = m2.iterator;
  while (n0.moveNext()) {
    var id = n0.current;
    map1exp[id.key] = id.value;
  }
  Expect.isTrue(map1exp is Map<int, String>);

  var map1 = <int, String>{for (var v in m2) v.key: v.value};
  // map1exp {1: a, 2: b, 3: c, 4: d, 5: e}
  Expect.isTrue(map1 is Map<int, String>);
  Expect.mapEquals(map1exp, map1);
}
