/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion int memLevel
 * Specifies how much memory should be allocated for the internal compression
 * state. 1 uses minimum memory but is slow and reduces compression ratio;
 * 9 uses maximum memory for optimal speed. The default value is 8.
 * @description Checks that the memLevel can be set in the range of 1..9
 * @author ngl@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";

main() {
  for (int level = 1; level <= 9; level++) {
    ZLibEncoder v = new ZLibEncoder(memLevel: level);
    Expect.equals(level, v.memLevel);
  }
}
