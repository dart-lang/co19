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
 * 1. If [element] is an [if] element:
 *
 *       i. Evaluate the condition expression to a value [condition].
 *      ii. Subject [condition] to boolean conversion to a value [result].
 *     iii. If [result] is [true]:
 *            a. Evaluate the "then" element using this procedure.
 *      iv. Else, if there is an "else" element of the [if]:
 *            a. Evaluate the "else" element using this procedure.
 * . . .
 * @description Checks that if [element] of list literal is an [if] element,
 * this element is evaluated using the specified procedure.
 * @author ngl@unipro.ru
 */
import "../../Utils/expect.dart";

main() {
  const t = false;
  const int x = 1;

  var list1exp = <int>[];
  if (t) {
    list1exp.add(x);
  } else {
    list1exp.add(x + 10);
  }
  if (!t) {
    list1exp.add(x);
  } else {
    list1exp.add(x + 10);
  }
  list1exp.add(2);
  Expect.isTrue(list1exp is List<int>);

  var list1 = <int>[if (t) x else x + 10, if (!t) x else x + 10, 2];
  // list1exp [11, 1, 2]
  Expect.listEquals(list1exp, list1);
  Expect.isTrue(list1 is List<int>);

  var list2exp = <int>[];
  if (t) {
    list2exp.add(x);
  } else {
    if (!t) {
      list2exp.add(x);
    } else {
       list2exp.add(x + 10);
    }
  }
  if (!t) {
    list2exp.add(x);
  } else {
    list2exp.add(x + 10);
  }
  list2exp.add(2);
  Expect.isTrue(list2exp is List<int>);

  var list2 = <int>[
    if (t) x else if (!t) x else x + 10,
    if (!t) x else x + 10, 2
  ];
  // list2exp [1, 1, 2]
  Expect.listEquals(list2exp, list2);
  Expect.isTrue(list2 is List<int>);

  var list3exp = <int>[];
  if (t) {
    list3exp.add(x);
  } else {
    list3exp.add(x + 10);
  }
  if (!t) {
    if (t) {
      list3exp.add(x);
    } else {
      list3exp.add(x + 10);
    }
  } else {
    list3exp.add(x + 10);
  }
  list3exp.add(2);
  Expect.isTrue(list3exp is List<int>);

  var list3 = [
    if (t) x else x + 10,
    if (!t) if (t) x else x + 10 else x + 10, 2
  ];
  // list3exp [11, 11, 2]
  Expect.listEquals(list3exp, list3);
  Expect.isTrue(list3 is List<int>);
}
