/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Iterable expand(Iterable f(E element))
 * Expands each element of this [Iterable] into zero or more elements.
 * The resulting [Iterable] runs through the elements returned by [f] for each
 * element of this, in order.
 * @description Checks that the method expands each element of this Iterable
 * into zero or more elements.
 * @author kaigorodov
 */
import "../../../Utils/expect.dart";
import "dart:collection";

main() {
  DoubleLinkedQueue queue = new DoubleLinkedQueue();
  
  for (int k = 0; k < 10; k++) {
    Expect.equals(0, queue.expand((element) => []).length);
    Expect.equals(k, queue.expand((element) => [element]).length);
    Expect.equals(2 * k, queue.expand((element) => [element, element]).length);
    queue.add(k);
  }
}
