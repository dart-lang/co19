/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion int get rawIndex
 * Returns -1 if the current rune is null.
 * @description Checks that -1 is returned.
 * @author msyabro
 */

import "../../../Utils/expect.dart";

main() {
  var it = new RuneIterator('');
  Expect.equals(-1, it.rawIndex);
  it.moveNext();
  Expect.equals(-1, it.rawIndex);

  it = new RuneIterator('a');
  Expect.equals(-1, it.rawIndex);
  it.moveNext();
  it.moveNext();
  Expect.equals(-1, it.rawIndex);
}