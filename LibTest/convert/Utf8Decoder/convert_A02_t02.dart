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
 * @description Checks that if the [codeUnits] start with the encoding of a
 * [unicodeBomCharacterRune], that character is discarded. Test
 * allowMalformed = true
 * @issue 28834
 * @author sgrekhov@unipro.ru
 */
import "dart:convert";
import "../../../Utils/expect.dart";

main() {
  Utf8Decoder decoder = new Utf8Decoder(allowMalformed: true);
  for (int i = 0; i < 128; i++) {
    String s = new String.fromCharCode(i);
    List<int> toDecode = [];
    toDecode.addAll(utf8.encode(
        new String.fromCharCodes([unicodeBomCharacterRune])));
    toDecode.add(i);
    Expect.equals(s, decoder.convert(toDecode));
  }

  List<int> toDecode = [];
  toDecode.addAll(utf8.encode(
      new String.fromCharCodes([unicodeBomCharacterRune])));
  toDecode.addAll([208, 154, 208, 184, 209, 128, 208, 184, 208, 187, 208, 187,
    208, 184, 209, 134, 208, 176, 32]);
  Expect.equals("Кириллица ", decoder.convert(toDecode));
}