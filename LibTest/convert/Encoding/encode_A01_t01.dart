/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion T encode(S input)
 * @description Checks that this method encodes string to data
 * @author sgrekhov@unipro.ru
 */
import "dart:convert";
import "../../../Utils/expect.dart";

check(Encoding encoding, String toEncode, List<int> expected) {
  List<int> encoded = encoding.encode(toEncode);
  Expect.listEquals(expected, encoded);
}

main() {
  check(Encoding.getByName("us-ascii"), "123abc",
      [0x31, 0x32, 0x33, 0x61, 0x62, 0x63]);
  check(Encoding.getByName("utf-8"), "123abc",
      [0x31, 0x32, 0x33, 0x61, 0x62, 0x63]);
  check(Encoding.getByName("utf-8"), "ащ", [0xd0, 0xb0, 0xd1, 0x89]);
  check(Encoding.getByName("iso-8859-1"), "123abc",
      [0x31, 0x32, 0x33, 0x61, 0x62, 0x63]);
  check(Encoding.getByName("iso-8859-1"), "âã", [0xe2, 0xe3]);
}
