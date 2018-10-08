/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion int windowBits
 * Base two logarithm of the window size (the size of the history buffer). It
 * should be in the range 8..15. Larger values result in better compression at
 * the expense of memory usage. The default value is 15.
 * @description Checks that the windowBits can be set in the range of 8..15,
 * with 15 being the default windowBits.
 * @author ngl@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";

main() {
  for (int value = 8; value <= 15; value++) {
    ZLibDecoder decoder = new ZLibDecoder(windowBits: value);
    Expect.equals(value, decoder.windowBits);
  }
}
