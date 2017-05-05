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
  Float64List l = new Float64List.fromList(
      [10.0, 20.0, 30.0, 40.0, 50.0, 60.0, 70.0, 80.0, 90.0, 100.0]);
  for (int i = 1; i <= 10; ++i) {
    Expect.equals(i * 10.0, l.elementAt(i - 1));
  }
}
