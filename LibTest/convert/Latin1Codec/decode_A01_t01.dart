/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion String decode(List<int> bytes, {bool allowInvalid})
 * Decodes the Latin-1 bytes (a list of unsigned 8-bit integers) to the
 * corresponding string.
 * ...
 * @description Checks that this method decodes the Latin-1 bytes (a list of
 * unsigned 8-bit integers) to the corresponding string.
 * @author sgrekhov@unipro.ru
 */
import "dart:convert";
import "../../../Utils/expect.dart";

main() {
  Latin1Codec codec = new Latin1Codec();
  for (int i = 0; i < 256; i++) {
    String s = new String.fromCharCode(i);
    Expect.equals(s, codec.decode([i]));
  }
  Expect.equals("", codec.decode([]));
  Expect.equals("12345", codec.decode([0x31, 0x32, 0x33, 0x34, 0x35]));
}
