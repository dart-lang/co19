/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void forEach(void f(E element))
 * Applies the function [f] to each element of this collection.
 * @description Checks that exception thrown in [f] breaks the iteration.
 * @author iarkh@unipro.ru
 */
import "../../../Utils/expect.dart";
import "dart:collection";

main() {
  List list = new List();
  List result = new List(100);
  DoubleLinkedQueue queue = new DoubleLinkedQueue();

  for(int i = 0; i < 100; i++) {
    list.add(i);
    queue.add(i);
  }

  int i = 0;
  queue.forEach((var element) {
    result[i++] = element;
  });

  Expect.listEquals(list, result);
}
