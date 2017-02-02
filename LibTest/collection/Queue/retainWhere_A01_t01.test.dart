/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void retainWhere(bool test(E element))
 * Removes all elements not matched by [test] from the queue.
 * @description Checks that all elements that satisfy [test] are left, and
 * elements that do not are removed.
 * @author sgrekhov@unipro.ru
 */
library retainWhere_A01_t01;
 
import "../../../Utils/expect.dart";
import "dart:collection";

test(Queue create([Iterable content])) {
  List source = [1, 3, 3, 4, 5, 6];
  
  void check(bool testFunc(var element)) {
    Queue a = create(source);
    a.retainWhere(testFunc);
    int k = 0;
    for (int i = 0; i < source.length; i++) {
      if (testFunc(source[i])) {
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
