/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Iterator<E> iterator
 * Returns a new [Iterator] that allows iterating the elements of this
 * [Iterable].
 * @description Checks that the returned [Iterator] iterates over all elements
 * of this [Iterable] object.
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

void checkIterator(List<int> list) {
  var l = new Uint8List.fromList(list);
  var it = l.iterator;
  var i = 0;
  while (it.moveNext()) {
    Expect.equals(l[i++], it.current);
  }
  Expect.equals(l.length, i);
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
