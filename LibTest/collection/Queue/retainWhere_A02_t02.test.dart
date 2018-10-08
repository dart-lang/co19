/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void retainWhere(bool test(E element))
 * ...
 * The [test] function must not throw or modify the queue.
 * @description Checks that if [test] function modifies the queue the exception is
 * thrown and operation stops
 * @issue 26587
 * @author sgrekhov@unipro.ru
 */
library retainWhere_A02_t02;
 
import "dart:collection";
import "../../../Utils/expect.dart";

test(Queue create([Iterable content])) {
  Queue queue = create([-3, -2, -1, 0, 1, 2, 3, -1]);

  bool throwFunction(var element) {
    queue.remove(element);
    return true;
  }

  // A concurrent modification is always thrown if the current entry is removed
  // from the queue during iteration. In case of other modifications result is
  // not predictable (see https://github.com/dart-lang/co19/issues/89)
  // So we are checking this case only
  Expect.throws( () {queue.retainWhere(throwFunction);});
  Expect.iterableEquals([-2, -1, 0, 1, 2, 3, -1], queue);
}
