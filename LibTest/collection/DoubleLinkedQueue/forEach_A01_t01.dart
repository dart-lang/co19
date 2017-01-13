/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void forEach(void f(E element))
 * Applies the function [f] to each element of this collection in iteration
 * order.
 * @description Checks that [forEach()] iterates over each element of the queue.
 * @author kaigorodov
 */

import "dart:collection";
import "../../../Utils/expect.dart";

main() {
  DoubleLinkedQueue queue = new DoubleLinkedQueue();
  
  for(int i = 0; i < 100; i++) {
    queue.addLast(i);
  }
  
  List a = new List(100);
  
  queue.forEach((var element) {
    a[element] = element;
  });
  
  for(int i = 0; i < 100; i++) {
    Expect.isTrue(a[i] == i);
  }
}
