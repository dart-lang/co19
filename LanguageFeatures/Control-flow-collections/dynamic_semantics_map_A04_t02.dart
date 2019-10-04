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
 * @description Checks that if [element] of map literal is a C-style [for]
 * element, this element is evaluated using the specified procedure. Checks that
 * the initializer clause of the element does not exist.
 * @author ngl@unipro.ru
 */
import "../../Utils/expect.dart";

main() {
  var map1exp = <int, num>{};
  var i = 0;
  for (; i < 10; i += 3) {
    if (i.isOdd) {
      map1exp[i] = i + 1.5;
    } else {
      map1exp[i] = i + 1;
    }
  }
  map1exp[i] = i;
  Expect.isTrue(map1exp is Map<int, num>);

  i = 0;
  var map1 = <int, num>{
    for (; i < 10; i += 3) if (i.isOdd) i: i + 1.5 else i: i + 1
  };
  // map1exp {0: 1, 3: 4.5, 6: 7, 9: 10.5, 12: 12}
  map1[i] = i;
  Expect.isTrue(map1 is Map<int, num>);
  Expect.mapEquals(map1exp, map1);
}
