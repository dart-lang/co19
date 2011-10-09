/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Returns the index in this array of the given [element], starting
 * the search at index [startIndex] to the length of this array.
 * @description Checks that the correct index is found.
 * @author iefremov
 * @reviewer msyabro
 */


main() {
  Array a = [42, 0, -1, 42, -1, 6031769, 0];
  Expect.isTrue(a.indexOf(42, 0) == 0);
  Expect.isTrue(a.indexOf(0, 0) == 1);
  Expect.isTrue(a.indexOf(42, 1) == 3);
  Expect.isTrue(a.indexOf(42, 3) == 3);
  Expect.isTrue(a.indexOf(6031769, 5) == 5);
  Expect.isTrue(a.indexOf(6031769, 0) == 5);
  Expect.isTrue(a.indexOf(0, 1) == 1);
  Expect.isTrue(a.indexOf(0, 2) == 6);
  Expect.isTrue(a.indexOf(0, 5) == 6);
  Expect.isTrue(a.indexOf(0, 6) == 6);
}
