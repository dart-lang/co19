/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion E elementAt(int index)
 * Returns the indexth element.
 * @description Checks that the indexth element is returned.
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

main() {
  var l = new Int16List.fromList([10, 20, 30, 40, 50, 60, 70, 80, 90, 100]);
  for (int i = 1; i <= 10; ++i) {
    Expect.equals(i * 10, l.elementAt(i - 1));
  }
}
