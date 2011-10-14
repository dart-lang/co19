/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Returns the index in this list of the given [element], starting
 * the search at index [startIndex] to the length of this list.
 * @description Checks that [startIndex] can be out of bounds
 * @author iefremov
 * @reviewer msyabro
 */

checkList(List list, var elem, int idx, int expected) {
  Expect.equals(expected, list.indexOf(elem, idx));
}

main() {
  checkList([42, 0, -1, 42, -1, 6031769, 0], 42, -1, 0);
  checkList([42, 0, -1, 42, -1, 6031769, 0], 777, -1, -1);
  checkList([42, 0, -1, 42, -1, 6031769, 0], null, -1, -1);
  checkList([42, 0, -1, 42, -1, 6031769, 0], 0, -1, 1);

  checkList([42, 0, -1, 42, -1, 6031769, 0], 42, 7, -1);
  checkList([42, 0, -1, 42, -1, 6031769, 0], 777, 7, -1);
  checkList([42, 0, -1, 42, -1, 6031769, 0], null, 7, -1);
  checkList([42, 0, -1, 42, -1, 6031769, 0], 0, 7, -1);

  checkList([42, 0, -1, 42, -1, 6031769, 0], 42, 6031769, -1);
  checkList([42, 0, -1, 42, -1, 6031769, 0], 777, 6031769, -1);
  checkList([42, 0, -1, 42, -1, 6031769, 0], null, 6031769, -1);
  checkList([42, 0, -1, 42, -1, 6031769, 0], 0, 6031769, -1);

  checkList([42, 0, -1, 42, -1, 6031769, 0], 42, -6031769, 0);
  checkList([42, 0, -1, 42, -1, 6031769, 0], 777, -6031769, -1);
  checkList([42, 0, -1, 42, -1, 6031769, 0], null, -6031769, -1);
  checkList([42, 0, -1, 42, -1, 6031769, 0], 0, -6031769, 1);
}

