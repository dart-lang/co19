/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion List<E> toList({bool growable: true})
 * Creates a List containing the elements of this Iterable.
 * The elements will be in iteration order. The list is fixed-length if growable
 * is false.
 * @description Checks that the list created with growable==true can change
 * it's size.
 * @author kaigorodov
 */
library toList_A01_t02;
import "../../../Utils/expect.dart";

void check(List l) {
  int len = l.length;
  l.add(0);
  Expect.equals(len + 1, l.length);

  l.clear();
  Expect.equals(0, l.length);
}

test(Iterable create([Iterable content])) {
  Iterable l = create([1, 2, 3, 4, 5]);
  List a = l.toList(growable:true);
  check(a);
  a = l.toList();
  check(a);
}
