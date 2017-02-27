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
 * ...
 * @description Checks that code units from start to, but no including, end
 * @author sgrekhov@unipro.ru
 */
import "dart:convert";
import "../../../Utils/expect.dart";

main() {
  Utf8Decoder decoder = new Utf8Decoder();
  String toEncode = "12345";
  List<int> toDecode = new List.from(toEncode.codeUnits);

  Expect.equals(toEncode, decoder.convert(toDecode));
  Expect.equals("2345", decoder.convert(toDecode, 1));
  Expect.equals("234", decoder.convert(toDecode, 1, 4));
}
