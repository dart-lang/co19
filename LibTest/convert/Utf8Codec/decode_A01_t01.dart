/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion String decode(List<int> codeUnits, {bool allowMalformed})
 * Decodes the UTF-8 codeUnits (a list of unsigned 8-bit integers) to the
 * corresponding string.
 * ...
 * @description Checks that this method decodes data to UTF-8 string
 * @author sgrekhov@unipro.ru
 */
import "dart:convert";
import "../../../Utils/expect.dart";

main() {
  Utf8Codec codec = new Utf8Codec();
  for (int i = 0; i < 128; i++) {
    String s = new String.fromCharCode(i);
    Expect.equals(s, codec.decode([i]));
  }

  Expect.equals("Кириллица ", codec.decode([208, 154, 208, 184, 209, 128, 208,
    184, 208, 187, 208, 187, 208, 184, 209, 134, 208, 176, 32]));
}
