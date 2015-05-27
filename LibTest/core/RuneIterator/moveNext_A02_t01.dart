/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool moveNext()
 * Returns false, if no element was left.
 * @description Checks that false is returned if no element left.
 * @author msyabro
 */

import "../../../Utils/expect.dart";

main() {
  var it = new RuneIterator('');
  Expect.isFalse(it.moveNext());

  it = new RuneIterator('abc');
  it.rawIndex = 2;
  Expect.isFalse(it.moveNext());
}