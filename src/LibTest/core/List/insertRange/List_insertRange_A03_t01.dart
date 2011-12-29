/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If [length] is 0, this method does not do anything.
 * @description Checks that this method does not do anything if [length] is 0.
 * @author vasya
 * @reviewer varlax
 */

void check(List src, int start, int length) {
  var srcLength = src.length;
  List copy = new List.from(src);

  src.insertRange(start, length);
  Expect.equals(srcLength, src.length);
  Expect.listEquals(copy,src);
}

main() {
  List l = new List();
  check(l, 0, 0);

  l = [];
  l.length = 37;
  check(l, 33, 0);

  l = new List();
  l.length = 15389;
  check(l, 13098, 0);

  l = new List();
  l.length = 1;
  check(l, 10, 0);
}
