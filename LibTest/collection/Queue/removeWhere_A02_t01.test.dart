/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void removeWhere(bool test(E element))
 * ...
 * The [test] function must not throw or modify the queue.
 * @description Checks that if [test] function throws an exception then
 * operation stops
 * @author sgrekhov@unipro.ru
 */
library removeWhere_A02_t01;
 
import "../../../Utils/expect.dart";
import "dart:collection";

bool throwFunction(var element) {
  if (element < 0) {
    return true;
  } else {
    throw new Exception();
  }
}

test(Queue create([Iterable content])) {
  Queue a = create([-3, -2, -1, 0, 1, 2, 3, -1]);
  Expect.throws(() { a.removeWhere(throwFunction); });
  Expect.iterableEquals([0, 1, 2, 3, -1], a);
}
