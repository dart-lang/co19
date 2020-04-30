/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final int current
 * The rune (integer Unicode code point) starting at the current position in the
 * string.
 * @description Checks that [current] is final and can't be set.
 * @author msyabro
 */

import "../../../Utils/expect.dart";

main() {
  dynamic it = new RuneIterator('a');
  Expect.throws(() {
    it.current = 1;
  });
}
