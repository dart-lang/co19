/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract Iterable<E> getRange(int start, int end)
 * Returns an Iterable that iterators over the elements in the range start to end exclusive.
 * The result of this function is backed by this.
 * @description Checks that an empty list is returned if end - start = 0.
 * @author vasya
 * @reviewer varlax
 */
import "../../../Utils/expect.dart";

void check(List src, int start) {
  var dst = src.getRange(start, start);
  Expect.equals(0, dst.length);
}

main() {
  List l = new List(1000);
  check(l, 0);
  check(l, 100);
  check(l, 999);
  check(l, 1000);

  l = [1,2,3];
  check(l, 0);
  check(l, 1);
  check(l, 2);
  check(l, 3);
}
