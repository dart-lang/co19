/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion int level
 * The compression-level can be set in the range of -1..9, with 6 being the
 * default compression level. Levels above 6 will have higher compression rates
 * at the cost of more CPU and memory usage. Levels below 6 will use less CPU
 * and memory at the cost of lower compression rates.
 * @description Checks that the compression-level can be set in the range of
 * -1..9
 * @author ngl@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";

main() {
  for (int level = -1; level <= 9; level++) {
    ZLibEncoder v = new ZLibEncoder(level: level);
    Expect.equals(level, v.level);
  }
}
