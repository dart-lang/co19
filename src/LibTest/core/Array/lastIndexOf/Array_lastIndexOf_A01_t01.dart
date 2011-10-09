/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Returns the last index in this array of the given [element], starting
 * the search at index [startIndex] to 0.
 * @description Checks that the correct index is found.
 * @author iefremov
 * @reviewer msyabro
 */


main() {
  Array a = [42, 0, -1, 42, -1, 6031769, 0];
  Expect.isTrue(a.lastIndexOf(42, 0) == 0);
  Expect.isTrue(a.lastIndexOf(0, 6) == 6);
  Expect.isTrue(a.lastIndexOf(42, 5) == 3);
  Expect.isTrue(a.lastIndexOf(42, 3) == 3);
  Expect.isTrue(a.lastIndexOf(42, 2) == 0);
  Expect.isTrue(a.lastIndexOf(6031769, 5) == 5);
  Expect.isTrue(a.lastIndexOf(6031769, 6) == 5);
  Expect.isTrue(a.lastIndexOf(0, 1) == 1);
  Expect.isTrue(a.lastIndexOf(0, 2) == 1);
  Expect.isTrue(a.lastIndexOf(0, 5) == 1);
  Expect.isTrue(a.lastIndexOf(0, 6) == 6);
}
