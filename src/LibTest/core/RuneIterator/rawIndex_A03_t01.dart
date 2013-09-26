/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void set rawIndex(int rawIndex)
 * Resets the iterator to the rune at the specified index of the string.
 * @description Checks that position is set correctly.
 * @author msyabro
 */

import "../../../Utils/expect.dart";


main() {
  var it = new RuneIterator('string');
  it.rawIndex = 2;
  Expect.equals(0x72, it.current);
  it.rawIndex = 5;
  Expect.equals(0x67, it.current);
  it.rawIndex = 5;
  Expect.equals(0x67, it.current);
  it.rawIndex = 0;
  Expect.equals(0x73, it.current);

  it = new RuneIterator('\u{10000}\u{10001}');
  it.rawIndex = 2;
  Expect.equals(0x10001, it.current);
  it.rawIndex = 0;
  Expect.equals(0x10000, it.current);
}