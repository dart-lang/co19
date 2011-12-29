/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If [length] is 0, this method does not do anything.
 * @description Checks that list is not changed if [length] is 0.
 * if the list is not extendable.
 * @author vasya
 * @reviewer varlax
 */

main() {
  var a = new List();
  a.removeRange(0, 0);
  Expect.equals(0, a.length);

  a.length = 11;
  a.removeRange(10, 0);
  Expect.equals(11, a.length);
  a.removeRange(1, 0);
  Expect.equals(11, a.length);

  a.length = 1025;
  a.removeRange(1026, 0);
  Expect.equals(1025, a.length);
}
