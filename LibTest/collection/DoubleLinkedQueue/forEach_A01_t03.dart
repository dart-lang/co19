/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void forEach(void f(E element))
 * Applies the function [f] to each element of this collection.
 * @description Checks that exception thrown in [f] breaks the iteration.
 * @author kaigorodov
 */
import "../../../Utils/expect.dart";
import "dart:collection";

main() {
  DoubleLinkedQueue queue = new DoubleLinkedQueue();
  
  queue.addLast(1);
  queue.addLast(2);
  
  int count = 0;
  try {
    queue.forEach((var element) {
      throw ++count;
    });
  } on Object catch(e) {
    Expect.equals(1, count);
  }
}
