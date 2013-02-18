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
 * @reviewer varlax
 */
import "../../../Utils/expect.dart";

void checkIterator(List a) {
  Iterator it = a.iterator;
  int i = 0;
  while (it.moveNext()) {
    Expect.isTrue(it.current == a[i++]);
  }
  Expect.equals(a.length, i);
}

main() {
  checkIterator([]);
  checkIterator(const [null,0,"1", false, const []]);
  checkIterator(new List(300));

  List a = new List(365);
  for (var i=0; i < a.length; i++) {
    a[i] = i;
  }
  checkIterator(a);

  List l = new List();
  l.addAll(["0","1","2","3","4","5"]);
  a = new List.from(l);
  checkIterator(a);
}
