/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract Iterable map(f(E element))
 * As long as the returned Iterable is not iterated over, the supplied function
 * f will not be invoked.
 * @description Checks that the supplied function [f] will not be invoked if the
 * returned [Iterable] is not iterated over.
 * @author kaigorodov
 */

import "dart:collection";
import "../../../Utils/expect.dart";

bool invoked = false;

f(var element) {
  invoked = true;
  return element;
}
  
main() {
  DoubleLinkedQueue queue = new DoubleLinkedQueue();
  queue.map(f);
  queue.add(22);
  queue.map(f);
  queue.add(11);
  queue.map(f);
  queue.add(11);
  queue.map(f);
  for (int k = -100; k < 200; k++) {
    queue.add(k);
  }
  queue.map(f);
  Expect.isFalse(invoked);
}
