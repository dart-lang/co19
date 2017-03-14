/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion String convert(
 *  List<int> bytes, [
 *  int start = 0,
 *  int end
 *  ])
 * Converts the bytes (a list of unsigned 7- or 8-bit integers) to the
 * corresponding string.
 * ...
 * @description Checks that this method decodes data to ASCII string
 * @author sgrekhov@unipro.ru
 */
import "dart:convert";
import "../../../Utils/expect.dart";

main() {
  AsciiDecoder decoder = new AsciiDecoder();
  for (int i = 0; i < 128; i++) {
    String s = new String.fromCharCode(i);
    Expect.equals(s, decoder.convert([i]));
  }
  for (int i = 128; i < 65536; i++) {
    Expect.throws(() {decoder.convert([i]);});
  }
}
