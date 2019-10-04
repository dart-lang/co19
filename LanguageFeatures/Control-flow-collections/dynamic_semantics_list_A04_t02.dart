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
 * . . .
 * 4. Else, if [element] is a C-style [for] element:
 *
 *      i. Evaluate the initializer clause of the element, if there is one.
 *     ii. Loop:
 *           a. Evaluate the condition expression to a value [condition].
 *              If there is no condition expression, use [true].
 *           b. If the boolean conversion of [condition] is not [true], exit
 *              the loop.
 *           c. Evaluate the body element using this procedure in the scope of
 *              the variable declared by the initializer clause if there is one.
 *           d. If there is an increment clause, execute it.
 * . . .
 * @description Checks that if [element] of list literal is a C-style [for]
 * element, this element is evaluated using the specified procedure. Checks that
 * the initializer clause of the element does not exist.
 * @author ngl@unipro.ru
 */
import "../../Utils/expect.dart";

main() {
  var list1exp = <num>[];
  var i = 2;
  for (; i < 10; i += 3) {
    if (i.isOdd) {
      list1exp.add(i + 0.5);
    } else {
      list1exp.add(i);
    }
  }
  list1exp.add(i);
  Expect.isTrue(list1exp is List<num>);

  i = 2;
  var list1 = <num>[for (; i < 10; i += 3) if (i.isOdd) i + 0.5 else i];
  list1.add(i);
  // list1exp [2, 5.5, 8, 11]
  Expect.isTrue(list1 is List<num>);
  Expect.listEquals(list1exp, list1);
}
