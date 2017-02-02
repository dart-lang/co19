/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void addAll(Iterable<E> iterable)
 * Throws [Error] if argument is [null].
 * @description Tries to call the method with [null] parameter.
 * @author msyabro
 */
library addAll_A02_t01;
 
import "../../../Utils/expect.dart";
import "dart:collection";

test(Queue create([Iterable content])) {
  Queue queue = create();
  Expect.throws(() { queue.addAll(null); }, (e) => e is Error);
}
