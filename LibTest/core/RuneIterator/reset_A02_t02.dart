/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void reset([int rawIndex = 0])
 * Setting a negative [rawIndex], or one greater than
 * [string].length, is an error.
 * @description Checks that it is an error if the index is greater
 * than [string].length.
 * @author msyabro
 */

import "../../../Utils/expect.dart";

main() {
  var it = new RuneIterator('string');
  Expect.throws(() {
    it.reset(7);
  });
  Expect.throws(() {
    it.reset(10);
  });
  Expect.throws(() {
    it.reset(100);
  });

  var empty = new RuneIterator('');
  Expect.throws(() {
    empty.reset(1);
  });
}