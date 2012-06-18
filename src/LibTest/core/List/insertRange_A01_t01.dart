/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Inserts a new range in the list, starting from [start] to
 * [:start + length:]. The entries are filled with [initialValue].
 * The length of this list grows by [length] value.
 * @description Checks valid insertions.
 * @author vasya
 * @reviewer varlax
 */

void check(List src, int start, int length, [initialValue = null]) {
  var srcLength = src.length;
  src.insertRange(start, length, initialValue);
  Expect.equals(srcLength + length, src.length);
  for(int i = start; i < length; i++) {
    Expect.equals(initialValue, src[i+start]);
    Expect.identical(initialValue, src[i+start]);
  }
}

main() {
  List l = new List();
  check(l, 0, 100, true);

  l = [];
  l.length = 37;
  check(l, 0, 1, -13.568);

  l = new List();
  l.length = 47890;
  check(l, 1, 10000, "foo");

  l = new List();
  l.length = 13;
  check(l, 12, 769);

  l = new List.from([]);
  l.length = 13;
  check(l, 12, 769);
}
