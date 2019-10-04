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
 * element, this element is evaluated using the specified procedure.
 * @author ngl@unipro.ru
 */
import "../../Utils/expect.dart";

main() {
  var list1exp = <int>[];
  for (var i = 1; i < 10; i += 3) {
    list1exp.add(i);
  }
  Expect.isTrue(list1exp is List<int>);

  var list1 = <int>[for (var i = 1; i < 10; i += 3) i];
  // list1exp [1, 4, 7]
  Expect.isTrue(list1 is List<int>);
  Expect.listEquals(list1exp, list1);

  var list2exp = <double>[];
  for (var i = 1.1; i < 10; i += 5) {
    list2exp.add(i + 2);
  }
  Expect.isTrue(list2exp is List<double>);

  var list2 = <double>[for (var i = 1.1; i < 10; i += 5) i + 2];
  // list2exp [3.1, 8.1]
  Expect.isTrue(list2 is List<double>);
  Expect.listEquals(list2exp, list2);

  var list3exp = <num>[];
  for (var i = 1.1; i < 10; i += 5) {
    list3exp.add(i + 2);
  }
  for (var i = 2; i < 6; i++) {
    list3exp.add(i + 3);
  }
  Expect.isTrue(list3exp is List<num>);

  var list3 = <num>[for (var i = 1.1; i < 10; i += 5) i + 2,
      for (var i = 2; i < 6; i++) i + 3];
  // list2exp [3.1, 8.1, 5, 6, 7, 8]
  Expect.isTrue(list3 is List<num>);
  Expect.listEquals(list3exp, list3);

  var list4exp = <Function>[];
  for (var i = 1; i < 4; i++) {
    list4exp.add(() => i);
  }
  Expect.isTrue(list4exp is List<Function>);
  var list4expRes = <int>[];
  for (var v in list4exp) {
    list4expRes.add(v());
  }

  var list4 = <Function>[for (var i = 1; i < 4; i++) () => i];
  // list4exp [Closure: () => int, Closure: () => int, Closure: () => int]
  Expect.isTrue(list4 is List<Function>);
  var list4res = <int>[];
  for (var v in list4) {
    list4res.add(v());
  }
  Expect.listEquals(list4expRes, list4res);
}
