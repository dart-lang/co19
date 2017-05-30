/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Iterator<E> iterator
 * ...
 * Each time iterator is read, it returns a new iterator, which can be used to
 * iterate through all the elements again. The iterators of the same iterable
 * can be stepped through independently, but should return the same elements in
 * the same order, as long as the underlying collection isn't changed.
 * @description Checks that every iterator of the same iterable should return
 * the same element in the same order.
 * @author ngl@unipro.ru
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

void checkIterator(List<int> list) {
  var l = new Int16List.fromList(list);
  var it1 = l.iterator;
  var it2 = l.iterator;
  var i = 0;
  for (i = 0; i < list.length; ++i) {
    it1.moveNext();
    it2.moveNext();
    Expect.equals(it1.current, it2.current);
  }
}

main() {
  checkIterator([]);
  checkIterator([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]);

  var a = new List<int>(255);
  for (var i = 0; i < a.length; i++) {
    a[i] = i;
  }
  checkIterator(a);
}
