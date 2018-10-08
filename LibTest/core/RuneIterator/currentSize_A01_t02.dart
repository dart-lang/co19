/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final int currentSize
 * The number of code units comprising the current rune.
 * @description Checks that [currentSize] is final and can't be set.
 * @author msyabro
 */

import "../../../Utils/expect.dart";

main() {
  dynamic it = new RuneIterator('1234567890');
  it.moveNext();
  try {
  it.currentSize = 5;
    Expect.fail('[currentSize] should be final');
  } on NoSuchMethodError catch(ok) {}
}
