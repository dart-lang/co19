/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract void sort([int compare(E a, E b)])
 * Sorts the list according to the order specified by the compare function.
 * The compare function must act as a Comparator.
 * The default List implementations use Comparable.compare if compare is omitted.
 * @description Checks sorting of short integer arrays with repeated elements.
 * @author iefremov
 */
library sort_A01_t03;

import "../../../Utils/expect.dart";

void check(Iterable a, List create([int length])) {
  int c(var x, var y) {
    return x < y ? -1 : (x == y ? 0 : 1);
  }

  var a_copy = create(a.length);
  a_copy.setRange(0, a.length, a);
  a_copy.sort(c);

  for(int i = 1; i < a.length; ++i) {
    Expect.isTrue(a_copy[i] >= a_copy[i-1]);
  }
}

test(List create([int length])) {

  int maxlen = 5;
  var a = new List(maxlen);
  int maxdigit = 3;
  int mindigit = -2;

  void iterate(int n) {
    if(n == 0) {
      check(a, create);
      return;
    }
    for(int i = mindigit; i < maxdigit; ++i) {
      a[n-1] = i;
      iterate(n-1);
    }
  }
  iterate(maxlen);
}
