/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Iterable expand(Iterable f(E element))
 * Expands each element of this Iterable into zero or more elements.
 * The resulting Iterable runs through the elements returned by f for each
 * element of this, in iteration order.
 * The returned Iterable is lazy, and calls f for each element of this every
 * time it's iterated.
 * @description Checks that the function [f] is called for every element of the
 * list.
 * Checks that resulting Iterable will run through the elements returned by f
 * for each element of this
 * @author kaigorodov
 * @author sgrekhov@unipro.ru
 */
library expand_A01_t01;
import "../../../Utils/expect.dart";

test(Iterable create([Iterable content])) {

  void checkCount(Iterable a) {
    int count = 0;
    Iterable expanded = a.expand((element) {
      Expect.equals(a.elementAt(count), element);
      count++;
      return [element, element];
    });

    Expect.equals(a.length * 2, expanded.length);
    // It's important to call expanded exactly once (the string above) before
    // this check. Otherwise count will have wrong value because returned
    // Iteratable is lazy
    Expect.equals(count, a.length);
  }

  checkCount(create());
  checkCount(create([1]));
  checkCount(create([1, 2]));
  checkCount(create([1, 2, 2]));
  checkCount(create([1, 2, 2, 3]));
}
