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
 * 1. If [element] is an [if] element:
 *
 *       i. Evaluate the condition expression to a value [condition].
 *      ii. Subject [condition] to boolean conversion to a value [result].
 *     iii. If [result] is [true]:
 *            a. Evaluate the "then" element using this procedure.
 *      iv. Else, if there is an "else" element of the [if]:
 *            a. Evaluate the "else" element using this procedure.
 * . . .
 * @description Checks that if [element] of set literal is an [if] element, this
 * element is evaluated using the specified procedure.
 * @author ngl@unipro.ru
 */
import "../../Utils/expect.dart";

main() {
  const t = false;
  const int x = 1;

  var set1exp = new Set<int>();
  if (t) {
    set1exp.add(x);
  } else {
    set1exp.add(x + 10);
  }
  if (!t) {
    set1exp.add(x + 1);
  } else {
    set1exp.add(x + 11);
  }
  set1exp.add(-1);
  Expect.isTrue(set1exp is Set<int>);

  var set1 = <int>{if (t) x else x + 10, if (!t) x + 1 else x + 11, -1};
  // set1exp {11, 2, -1}
  Expect.setEquals(set1exp, set1);
  Expect.isTrue(set1 is Set<int>);

  var set2exp = new Set<int>();
  if (t) {
    set2exp.add(x);
  } else {
    if (!t) {
      set2exp.add(x);
    } else {
      set2exp.add(x + 10);
    }
  }
  if (!t) {
    set2exp.add(x + 1);
  } else {
    set2exp.add(x + 11);
  }
  set2exp.add(-1);
  Expect.isTrue(set2exp is Set<int>);

  var set2 = <int>{
    if (t) x else if (!t) x else x + 10,
    if (!t) x + 1 else x + 11, -1
  };
  // set2exp {1, 2, -1}
  Expect.setEquals(set2exp, set2);
  Expect.isTrue(set2 is Set<int>);

  var set3exp = new Set<int>();
  if (t) {
    set3exp.add(x);
  } else {
    set3exp.add(x + 10);
  }
  if (!t) {
    if (t) {
      set3exp.add(x + 1);
    } else {
      set3exp.add(x + 11);
    }
  } else {
    set3exp.add(x + 12);
  }
  set3exp.add(-1);
  Expect.isTrue(set3exp is Set<int>);

  var set3 = {
    if (t) x else x + 10,
    if (!t) if (t) x + 1 else x + 11 else x + 12, -1
  };
  // set3exp {11, 12, -1}
  Expect.setEquals(set3exp, set3);
  Expect.isTrue(set3 is Set<int>);
}
