/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final String currentAsString
 * A string containing the current rune.
 * @description Checks that [currentAsString] is final and can't be set.
 * @author msyabro
 */

import "../../../Utils/expect.dart";

main() {
  dynamic it = new RuneIterator('a');

  try {
    it.currentAsString = '1';
    Expect.fail('[currentAsString] should be final');
  } on NoSuchMethodError catch(ok) {}
}
