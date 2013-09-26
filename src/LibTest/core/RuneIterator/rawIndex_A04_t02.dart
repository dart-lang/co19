/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void set rawIndex(int rawIndex)
 * Setting a negative [rawIndex], or one greater than or equal
 * to [string].length, is an error.
 * @description Checks that it is an error if the index is greater
 * than or equal to [string].length.
 * @author msyabro
 */

import "../../../Utils/expect.dart";

main() {
  var it = new RuneIterator('string');
  Expect.throws(() {
    it.rawIndex = 6;
  });
  Expect.throws(() {
    it.rawIndex = 10;
  });
  Expect.throws(() {
    it.rawIndex = 100;
  });

  var empty = new RuneIterator('');
  Expect.throws(() {
    empty.rawIndex = 0;
  });
  Expect.throws(() {
    empty.rawIndex = 1;
  });
}