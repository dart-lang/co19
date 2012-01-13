/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Returns an empty list if [length] is 0.
 * @description Checks that an empty list is returned if [length] is 0.
 * @author vasya
 * @reviewer varlax
 */

void check(List src, int start) {
  var dst = src.getRange(start, 0);
  Expect.equals(0, dst.length);
}

main() {
  List l = new List(1000);
  check(l, 0);
  check(l, 100);
  check(l, 999);
  check(l, 1000);
}
