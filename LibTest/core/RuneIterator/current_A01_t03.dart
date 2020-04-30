/*
 * Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final int current
 * The rune (integer Unicode code point) starting at the current position in the
 * string.
 * @description Checks that the -1 is returned when it is no current rune
 * @author sgrekhov@unipro.ru
 */

import "../../../Utils/expect.dart";

main() {
  var it = new RuneIterator('');
  Expect.equals(-1, it.current);
  it.moveNext();
  Expect.equals(-1, it.current);

  it = new RuneIterator('a');
  Expect.equals(-1, it.current);
  it.moveNext();
  it.moveNext();
  Expect.equals(-1, it.current);
}