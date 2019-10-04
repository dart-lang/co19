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
 * @description Checks that if [element] of list literal is a an asynchronous
 * [await for-in] element, this element is evaluated using the specified
 * procedure.
 * @author ngl@unipro.ru
 */
import "dart:async";
import "../../Utils/expect.dart";

main() async {
  var l1 = [1, 2];
  var l2 = [3, 4, 5];
  var list1exp = <int>[1, 2, 4, 5, 6];

  var s1 = new Stream.fromIterable(l1);
  var s2 = new Stream.fromIterable(l2);

  var list1 = <int>[await for (var v in s1) v, await for (var v in s2) v + 1];
  Expect.isTrue(list1 is List<int>);
  Expect.listEquals(list1exp, list1);
}
