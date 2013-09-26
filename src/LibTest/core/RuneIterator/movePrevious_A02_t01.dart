/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool movePrevious()
 * Returns false and sets [current] to null if there is no previous element.
 * @description Checks that false is returned if no previous element left.
 * @author msyabro
 */

import "../../../Utils/expect.dart";

main() {
  var it = new RuneIterator('');
  Expect.isFalse(it.movePrevious());

  it = new RuneIterator('abc');
  it.moveNext();
  Expect.isFalse(it.movePrevious());
}