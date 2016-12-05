/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Iterable expand(Iterable f(E element))
 * The returned [Iterable] is lazy, and calls [f] for each element of this every
 * time it's iterated.
 * @description Checks that the returned calls f for each element of this
 * every time it's iterated.
 * @author kaigorodov
 */
import "../../../Utils/expect.dart";
import "dart:collection";

int count=0;

Iterable f(int element) {
   count++;
   return [count];   
}

main() {
  DoubleLinkedQueue<int> queue = new DoubleLinkedQueue<int>();
  
  for (int k = 0; k < 10; k++) {
    queue.add(k);
  }

  Iterable expanded = queue.expand(f);
  int count2 = 0;

  for (int k = 1; k < 10; k++) {
    Iterator it=expanded.iterator;
    while (it.moveNext()) {
      count2++;
      Expect.equals(count2, it.current);
    }
  }
  
}
