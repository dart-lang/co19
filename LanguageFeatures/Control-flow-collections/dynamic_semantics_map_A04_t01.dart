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
 * element, this element is evaluated using the specified procedure.
 * @author ngl@unipro.ru
 */
import "../../Utils/expect.dart";

main() {
  var map1exp = <int, int>{};
  for (var i = 1; i < 10; i += 3) {
    map1exp[i] = i + 1;
  }
  Expect.isTrue(map1exp is Map<int, int>);

  var map1 = <int, int>{for (var i = 1; i < 10; i += 3) i: i + 1};
  Expect.isTrue(map1 is Map<int, int>);
  Expect.mapEquals(map1exp, map1);

  var map2exp = <int, double>{};
  for (var i = 1; i < 10; i += 5) {
    map2exp[i] = i + .5;
  }
  Expect.isTrue(map2exp is Map<int, double>);

  var map2 = <int, double>{for (var i = 1; i < 10; i += 5) i: i + .5};
  Expect.isTrue(map2 is Map<int, double>);
  Expect.mapEquals(map2exp, map2);

  var map3exp = <double, int>{};
  for (var i = 1; i < 10; i += 5) {
    map3exp[i + 1.5] = i;
  }
  Expect.isTrue(map3exp is Map<double, int>);

  var map3 = <double,int>{for (var i = 1; i < 10; i += 5) i + 1.5: i};
  Expect.isTrue(map3 is Map<double, int>);
  Expect.mapEquals(map3exp, map3);

  var map4exp = <num, num>{};
  for (var i = 1.1; i < 10; i += 5) {
    map4exp[i] = i + 2;
  }
  for (var i = 2; i < 6; i++) {
    map4exp[i] = i + 3;
  }
  Expect.isTrue(map4exp is Map<num, num>);

  var map4 = <num, num>{for (var i = 1.1; i < 10; i += 5) i: i + 2,
      for (var i = 2; i < 6; i++) i: i + 3};
  Expect.isTrue(map4 is Map<num, num>);
  Expect.mapEquals(map4exp, map4);

  var map5exp = <int, Function>{};
  var fs = <Function>[];
  for (var i = 1; i < 4; i++) {
    fs.add(() => i + 10);
    map5exp[i] = fs[i - 1];
  }
  var map5 = <int, Function>{for (var i = 1; i < 4; i++) i: fs[i - 1]};
  Expect.isTrue(map5 is Map<int, Function>);
  Expect.mapEquals(map5exp, map5);
}
