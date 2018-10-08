/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion String convert(
 *  List<int> codeUnits, [
 *  int start = 0,
 *  int end
 *  ])
 * Converts the UTF-8 codeUnits (a list of unsigned 8-bit integers) to the
 * corresponding string.
 *
 * Uses the code units from start to, but no including, end. If end is omitted,
 * it defaults to codeUnits.length.
 *
 * If the codeUnits start with the encoding of a unicodeBomCharacterRune this
 * character is discarded.
 * @description Checks that this method decodes data to UTF-8 string
 * @author sgrekhov@unipro.ru
 */
import "dart:convert";
import "../../../Utils/expect.dart";

main() {
  Utf8Decoder decoder = new Utf8Decoder();
  for (int i = 0; i < 128; i++) {
    String s = new String.fromCharCode(i);
    Expect.equals(s, decoder.convert([i]));
  }

  Expect.equals("Кириллица ", decoder.convert([208, 154, 208, 184, 209, 128,
    208, 184, 208, 187, 208, 187, 208, 184, 209, 134, 208, 176, 32]));
}
