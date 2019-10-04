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
 * 3. Else, if [element] is an asynchronous [await for-in] element:
 *
 *      i. Evaluate the stream expression to a value [stream]. It is a dynamic
 *         error if [stream] is not an instance of a class that implements
 *         [Stream].
 *     ii. Create a new [Future], [streamDone].
 *    iii. Evaluate [await streamDone].
 *     iv. Listen to [stream]. On each data event [event] the stream sends:
 *           a. If the [for-in] element declares a variable, create a fresh
 *              [variable] for it. Otherwise, use the existing [variable] it
 *              refers to.
 *           b. Bind [event] to [variable].
 *           c. Evaluate the body element using this procedure in the scope of
 *              [variable]. If this raises an exception, complete [streamDone]
 *              with it as an error.
 *      v. If the [for-in] element declares a variable, discard it.
 *     vi. If [stream] raises an exception, complete [streamDone] with it as an
 *         error. Otherwise, when all events in the stream are in the stream are
 *         processed, complete [streamDone] with [null].
 * . . .
 * @description Checks that if [element] of map literal is a an asynchronous
 * [await for-in] element, this element is evaluated using the specified
 * procedure.
 * @author ngl@unipro.ru
 */
import "dart:async";
import "../../Utils/expect.dart";

main() async {
  var m1 = [MapEntry(1, 'a'), MapEntry(2, 'b'), MapEntry(3, 'c'),
      MapEntry(4, 'd'), MapEntry(5, 'e')
  ];
  var m2 = [MapEntry(11, 'abc'), MapEntry(12, 'def')];
  var map1exp = <int, String>{1: 'a', 2: 'b', 3: 'c', 4: 'd', 5: 'e', 11: 'abcn', 12: 'defn'};

  var s1 = new Stream.fromIterable(m1);
  var s2 = new Stream.fromIterable(m2);

  var map1 = <int, String>{await for (var v in s1) v.key: v.value,
      await for (var v in s2) v.key: v.value + 'n'};
  Expect.isTrue(map1 is Map<int, String>);
  Expect.mapEquals(map1exp, map1);
}
