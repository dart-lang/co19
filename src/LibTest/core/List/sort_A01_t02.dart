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
 * @description Checks sorting of some permutations of integer arrays with unique elements.
 * @author iefremov
 * @reviewer pagolubev
 */

main() {
  int c(var a, var b) {
    return a < b ? -1 : (a == b ? 0 : 1);
  }

  int maxlen = 7;
  for(int length = 1; length < maxlen; ++length) {
    List a = new List(length);
    List expected = new List(length);
    for(int i = 0; i < length; ++i) {
      expected[i] = i;
      a[i] = i;
    }

    void swap(int i, int j) {
      var t = a[i];
      a[i] = a[j];
      a[j] = t;
    }

    void check() {
      var a_copy = new List(length);
      a_copy.copyFrom(a, 0, 0, length);
      a_copy.sort(c);
      Expect.listEquals(expected, a_copy);
    }

    void permute(int n) {
      if (n == 1) {
        check();
      }
      else {
        for (int i = 0; i < n; i++) {
          permute(n-1);
          if (n % 2 == 1) {
            swap(0, n-1);
          } else {
            swap(i, n-1);
          }
        }
      }
    } //void permute
    permute(length);
  } //for i in 0..length
} //main
