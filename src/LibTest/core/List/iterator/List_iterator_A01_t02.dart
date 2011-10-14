/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Returns an [Iterator] that iterates over this [Iterable] object.
 * @description Checks that the returned [Iterator] iterates all elements of the list.
 * @author vasya
 * @reviewer msyabro
 */

void checkIterator(List a) {
  Iterator it = a.iterator();
  var i = 0;
  while (it.hasNext()) {
    Expect.isTrue(it.next() == a[i]);
    ++i;
  }
  Expect.isTrue(i == a.length);
}

main() {
  checkIterator([]);
  checkIterator([null,0,"1", false,[]]);
  checkIterator(new List(300));

  List a = new List(36547);
  for (var i=0; i < a.length; i++) {
    a[i] = i;
  }
  checkIterator(a);

  List l = new List();
  l.addAll(["0","1","2","3","4","5"]);
  a = new List.from(l);
  checkIterator(a);
}
