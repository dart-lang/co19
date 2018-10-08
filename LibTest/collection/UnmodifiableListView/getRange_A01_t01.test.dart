/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Iterable<E> getRange(int start, int end)
 * Returns an [Iterable] that iterates over the elements in the range [start] to
 * [end] exclusive.
 * @description Checks result lists with valid ranges.
 * @author iarkh@unipro.ru
 */
import "dart:collection";
import "../../../Utils/expect.dart";

void check(List src, int start, int length) {
  UnmodifiableListView a = new UnmodifiableListView(src);
  Iterator dst = a.getRange(start, start + length).iterator;
  for(int i = 0; dst.moveNext(); i++) {
    Expect.equals(a[i + start], dst.current);
    Expect.identical(a[i + start], dst.current);
  }
}

main() {

  List l = [1, 189, -14, null, 12345];
  check(l, 0, 5);
  check(l, 0, 1);
  check(l, 1, 3);
  check(l, 3, 1);

  l = new List(100);
  for (var i = 0; i < l.length; i++){
    l[i] = i;
  }
  check(l, 0, 100);
  check(l, 0, 1);
  check(l, 99, 1);
  check(l, 90, 9);
}
