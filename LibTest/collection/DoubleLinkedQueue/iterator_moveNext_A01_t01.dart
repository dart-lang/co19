/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by list
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Returns whether the [Iterator] has elements left.
 * @description Checks that [true] is returned only if [Iterator] has some
 * elements left.
 * @author kaigorodov
 */
import "../../../Utils/expect.dart";
import "dart:collection";

main() {
  DoubleLinkedQueue list = new DoubleLinkedQueue();
  Expect.isFalse(list.iterator.moveNext());
  list.add(0);
  Iterator it = list.iterator;
  Expect.isTrue(it.moveNext());
  Expect.isFalse(it.moveNext());

  list = new DoubleLinkedQueue();
  for(int i = 0 ; i < 10000; i++) {
    list.add(i);
  }
  it = list.iterator;
  for (var i = 0; i < list.length; i++) {
    Expect.isTrue(it.moveNext());
  }
  Expect.isFalse(it.moveNext());

  list.clear();
  it = list.iterator;
  Expect.isFalse(it.moveNext());

  list.add(1);
  it = list.iterator;
  Expect.isTrue(it.moveNext());
}
