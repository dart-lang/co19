// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Iterable<E> takeWhile(bool test(E value))
/// Every new Iterator of the returned Iterable will start iterating over the
/// elements of this.
/// @description Checks that every new iterator starts iterating over the
/// elements of this.
/// @author kaigorodov

library takeWhile_A03_t01;
import "../../../Utils/expect.dart"	;

void check(Iterable a0, bool test0(var element)) {
  var el;
  bool tst(var element) {
    bool res = test0(element);
    if (res) {
      el = element;
    }
    return res;
  }
  
  Iterable itbl = a0.takeWhile(tst);
  for (int k = 0; k < 5; k++) {
    Iterator it = itbl.iterator;
    int i = 0;
    while (it.moveNext()) {
      Expect.equals(a0.elementAt(i), el);
      Expect.equals(el, it.current);
      i++;
    }  
  }
}

test(Iterable create([Iterable content])) {
  Iterable a0 = create([1, 3, 7, 4, 5, 6]);
  check(a0, (var element) => element == 1);
  check(a0, (var element) => true);
  check(a0, (var element) => false);
  check(a0, (var element) => element > 4);
  check(a0, (var element) => element < 4);
  check(a0, (var element) => element == 4);
}
