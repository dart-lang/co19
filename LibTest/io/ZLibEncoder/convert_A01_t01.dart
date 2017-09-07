/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion List<int> convert(List<int> bytes)
 * Convert a list of bytes using the options given to the ZLibEncoder
 * constructor.
 * @description Checks that the the convert method works correctly.
 * @author ngl@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";

main() {
  ZLibEncoder encoder = new ZLibEncoder();
  List<int> input = [1, 2, 3, 4, 5, 6];
  ZLibDecoder decoder = new ZLibDecoder();

  List<int> encoded = encoder.convert(input);

  List<int> decoded = decoder.convert(encoded);
  Expect.listEquals(input, decoded);
}
