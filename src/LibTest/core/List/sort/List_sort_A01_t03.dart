/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Sorts the list according to the order specified by the comparator.
 * The comparator function [compare] must take two arguments [a] and [b]
 * and return
 *   an integer strictly less than 0 if a < b,
 *   0 if a = b, and
 *   an integer strictly greater than 0 if a > b.
 * @description Checks sorting of short integer arrays with repeated elements.
 * @author iefremov
 * @reviewer pagolubev
 */



void check(var a) {
  int c(var a, var b) {
    return a < b ? -1 : (a == b ? 0 : 1);
  }

  var a_copy = new List(a.length);
  a_copy.copyFrom(a, 0, 0, a.length);
  a_copy.sort(c);

  for(int i = 1; i < a.length; ++i) {
    Expect.isTrue(a_copy[i] >= a_copy[i-1]);
  }
}

main() {
  int maxlen = 5;
  var a = new List(maxlen);
  int maxdigit = 3;
  int mindigit = -2;

  void iterate(int n) {
    if(n == 0) {
      check(a);
      return;
    }
    for(int i = mindigit; i < maxdigit; ++i) {
      a[n-1] = i;
      iterate(n-1);
    }
  }
  iterate(maxlen);
}
