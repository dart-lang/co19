/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion  void removeWhere(bool test(E element))
 * Removes all elements matched by [test] from the queue.
 * @description Checks that all elements that satisfy [test] are removed, and
 * elements that does not are left.
 * @author sgrekhov@unipro.ru
 */
library removeWhere_A01_t01;
 
import "../../../Utils/expect.dart";
import "dart:collection";

test(Queue create([Iterable content])) {
  List source = [1, 3, 3, 4, 5, 6];

  void check(bool testFunc(var element)) {
    Queue a = create(source);
    a.removeWhere(testFunc);
    int k = 0;
    for (int i = 0; i < source.length; i++) {
      if (!testFunc(source[i])) {
        Expect.identical(source[i], a.elementAt(k), "i=$i, k=$k");
        k++;
      }
    }
    Expect.equals(a.length, k, "a.length=${a.length} k=$k");
  }

  check((var element) => true);
  check((var element) => false);
  check((var element) => element > 4);
  check((var element) => element < 4);
  check((var element) => element == 4);
}
