/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion const Base64Decoder()
 * @description Checks that this constructor creates valid Base64Decoder which
 * works as expected
 * @author sgrekhov@unipro.ru
 */
import "dart:convert";
import "../../../Utils/expect.dart";

check(Base64Decoder decoder, List<int> toEncode) {
  String encoded = base64.encode(toEncode);
  Expect.listEquals(toEncode, decoder.convert(encoded));
}

main() {
  Base64Decoder decoder = new Base64Decoder();
  for (int i = 0; i < 256; i++) {
    check(decoder, [i]);
  }
  Expect.listEquals("abcdefghijklmnopqrstuvwxyz".codeUnits,
      decoder.convert("YWJjZGVmZ2hpamtsbW5vcHFyc3R1dnd4eXo="));
}
