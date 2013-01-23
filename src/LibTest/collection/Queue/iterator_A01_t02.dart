/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Returns an [Iterator] that iterates over this [Iterable] object.
 * @description Checks that [Iterator] iterates over all elements of the list.
 * @author msyabro
 * @reviewer varlax
 */
import "dart:collection";

void checkIterator(Queue list) {
  Iterator it = list.iterator;
  list.forEach((var element) {
    it.moveNext();
    Expect.equals(element, it.current);
  });
  Expect.isFalse(it.moveNext());
}

main() {
  checkIterator(new Queue());
  checkIterator(new Queue.from([null,0,"1", false,[]]));

  List a = new List(36547);
  for (var i=0; i < a.length; i++) {
    a[i] = i;
  }
  checkIterator(new Queue.from(a));

  Queue l = new Queue();
  l.addAll(["0","1","2","3","4","5"]);
  checkIterator(l);
}
