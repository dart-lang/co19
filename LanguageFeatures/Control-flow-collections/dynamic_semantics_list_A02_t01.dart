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
 *
 * Lists
 *
 * 1. Create a fresh instance [collection] of a class that implements [List<E>].
 *
 *    An implementation is, of course, free to optimize by pre-allocating a list
 *    of the correct capacity when its size is statically known. Note that when
 *    [if] and [for] come into play, it's no longer always possible to
 *    statically tell the final size of the resulting flattened list.
 *
 * 2. For each [element] in the list literal:
 *
 *      i. Evaluate [element] using the procedure below.
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
 * @description Checks that if [element] of list literal is a synchronous
 * [for-in] element, this element is evaluated using the specified procedure.
 * @author ngl@unipro.ru
 */
import "../../Utils/expect.dart";

main() {
  var l1 = [1, 2];
  var l2 = [3, 4, 5];

  var list1exp = <int>[];
  var n0 = l1.iterator;
  while (n0.moveNext()) {
    var id = n0.current;
    list1exp.add(id);
  }
  n0 = l2.iterator;
  while (n0.moveNext()) {
    var id = n0.current;
    list1exp.add(id + 1);
  }
  Expect.isTrue(list1exp is List<int>);

  var list1 = <int>[for (var v in l1) v, for (var v in l2) v + 1];
  // list1exp [1, 2, 4, 5, 6]
  Expect.isTrue(list1 is List<int>);
  Expect.listEquals(list1exp, list1);
}
