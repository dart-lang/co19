/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void retainWhere(bool test(E element))
 * ...
 * The test function must not throw or modify the queue.
 * @description Checks that if test function modifies the queue the exception is
 * thrown and operation stops
 * @author sgrekhov@unipro.ru
 */
library retainWhere_A02_t02;
 
import "dart:collection";
import "../../../Utils/expect.dart";

test(Queue create([Iterable content])) {
  Queue queue = create([-3, -2, -1, 0, 1, 2, 3, -1]);

  bool throwFunction(var element) {
    if (element < 0) {
      return true;
    } else {
      queue.add(-2);
      return false;
    }
  }

  Expect.throws(() {queue.retainWhere(throwFunction);});
  Expect.iterableEquals([-3, -2, -1, 0, 1, 2, 3, -1, -2], queue);
}
