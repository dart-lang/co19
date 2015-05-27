/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void set rawIndex(int rawIndex)
 * Setting [rawIndex] in the middle of a surrogate pair is an error.
 * @description Checks that it is an error if the index is in the
 * middle of a surrogate pair.
 * @author msyabro
 */

import "../../../Utils/expect.dart";

main() {
  var it = new RuneIterator('\u{10000}\u{10001}');
  Expect.throws(() {
    it.rawIndex = 1;
  });
  Expect.throws(() {
    it.rawIndex = 3;
  });

}