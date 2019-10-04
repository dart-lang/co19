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
 * Sets
 *
 * 1. Create a fresh instance [collection] of a class that implements [Set<E>].
 *
 * 2. For each [element] in the set literal:
 *     i. Evaluate [element] using the procedure below.
 *
 * 3. The result of the literal expression is [collection].
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
 * @description Checks that if [element] of set literal is a synchronous
 * [for-in] element, this element is evaluated using the specified procedure.
 * @author ngl@unipro.ru
 */
import "../../Utils/expect.dart";

main() {
  var l1 = [1, 2];
  var l2 = [3, 4, 5];

  var set1exp = new Set<int>();
  var n0 = l1.iterator;
  while (n0.moveNext()) {
    var id = n0.current;
    set1exp.add(id);
  }
  n0 = l2.iterator;
  while (n0.moveNext()) {
    var id = n0.current;
    if (id.isOdd) {
      set1exp.add(id + 1);
    }
  }
  Expect.isTrue(set1exp is Set<int>);

  var set1 = <int>{for (var v in l1) v, for (var v in l2) if (v.isOdd) (v + 1)};
  // set1exp {1, 2, 4, 6}
  Expect.setEquals(set1exp, set1);
  Expect.isTrue(set1 is Set<int>);
}
