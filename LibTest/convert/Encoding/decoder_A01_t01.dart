/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Converter<List<int>, String> decoder
 * @description Checks that this property returns Converter instance which works
 * as expected
 * @author sgrekhov@unipro.ru
 */
import "dart:convert";
import "../../../Utils/expect.dart";

check(Converter decoder, List<int> toDecode, String expected) {
  String decoded = decoder.convert(toDecode);
  Expect.equals(expected, decoded);
}

main() {
  check(Encoding.getByName("us-ascii").decoder,
      [0x31, 0x32, 0x33, 0x61, 0x62, 0x63], "123abc");
  check(Encoding.getByName("utf-8").decoder,
      [0x31, 0x32, 0x33, 0x61, 0x62, 0x63], "123abc");
  check(Encoding.getByName("utf-8").decoder,
      [0xd0, 0xb0, 0xd1, 0x89], "ащ");
  check(Encoding.getByName("iso-8859-1").decoder,
      [0x31, 0x32, 0x33, 0x61, 0x62, 0x63], "123abc");
  check(Encoding.getByName("iso-8859-1").decoder,
      [0xe2, 0xe3], "âã");
}
