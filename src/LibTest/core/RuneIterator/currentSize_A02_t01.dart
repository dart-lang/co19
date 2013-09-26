/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final int currentSize
 * Returns zero if there is no current rune ([current] is null).
 * @description Checks that zero is returned if [current] is null.
 * @author msyabro
 */

import "../../../Utils/expect.dart";

main() {
  var it = new RuneIterator('');
  Expect.equals(0, it.currentSize);
  it.moveNext();
  Expect.equals(0, it.currentSize);

  it = new RuneIterator('a');
  Expect.equals(0, it.currentSize);
  it.moveNext();
  it.moveNext();
  Expect.equals(0, it.currentSize);
}