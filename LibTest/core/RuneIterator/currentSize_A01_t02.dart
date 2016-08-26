/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final int currentSize
 * The number of code units comprising the current rune.
 * @description Checks that [currentSize] is final and can't be set (causes
 * compile error in strong mode).
 * @compile-error
 * @author msyabro
 */

main() {
  var it = new RuneIterator('1234567890');
  it.moveNext();
  it.currentSize = 5;
}
