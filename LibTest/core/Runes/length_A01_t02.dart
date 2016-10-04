/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final int length
 * Returns the number of elements in this.
 * @description Checks that [length] is final and can't be set.
 * @author msyabro
 */

import "../../../Utils/expect.dart";

main() {
  dynamic runes = new Runes('');
  try {
  runes.length = 1;
    Expect.fail('[length] should be final');
  } on NoSuchMethodError catch (ok) {}

}
