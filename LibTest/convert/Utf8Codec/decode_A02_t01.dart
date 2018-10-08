/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion String decode(List<int> codeUnits, {bool allowMalformed})
 * Decodes the UTF-8 codeUnits (a list of unsigned 8-bit integers) to the
 * corresponding string.
 *
 * If the [codeUnits] start with the encoding of a [unicodeBomCharacterRune],
 * that character is discarded.
 * ...
 * @description Checks that if the [codeUnits] start with the encoding of a
 * [unicodeBomCharacterRune], that character is discarded
 * @issue 28834
 * @author sgrekhov@unipro.ru
 */
import "dart:convert";
import "../../../Utils/expect.dart";

main() {
  Utf8Codec codec = new Utf8Codec();
  for (int i = 0; i < 128; i++) {
    String s = new String.fromCharCode(i);
    List<int> toDecode = [];
    toDecode.addAll(codec.encode(
        new String.fromCharCodes([unicodeBomCharacterRune])));
    toDecode.add(i);
    Expect.equals(s, codec.decode(toDecode));

  }

  List<int> toDecode = [];
  toDecode.addAll(codec.encode(
      new String.fromCharCodes([unicodeBomCharacterRune])));
  toDecode.addAll([208, 154, 208, 184, 209, 128,
    208, 184, 208, 187, 208, 187, 208, 184, 209, 134, 208, 176, 32]);
  Expect.equals("Кириллица ", codec.decode(toDecode));
}
