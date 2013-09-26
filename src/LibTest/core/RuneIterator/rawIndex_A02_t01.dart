/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion int get rawIndex
 * Returns null if the current rune is null.
 * @description Checks that null is returned.
 * @author msyabro
 */

import "../../../Utils/expect.dart";

main() {
  var it = new RuneIterator('');
  Expect.isNull(it.rawIndex);
  it.moveNext();
  Expect.isNull(it.rawIndex);

  it = new RuneIterator('a');
  Expect.isNull(it.rawIndex);
  it.moveNext();
  it.moveNext();
  Expect.isNull(it.rawIndex);
}