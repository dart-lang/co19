/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion const Base64Encoder.urlSafe()
 * @description Checks that this constructor creates valid Base64Encoder in
 * "URL and Filename safe" Base 64 Alphabet
 * @author sgrekhov@unipro.ru
 */
import "dart:convert";
import "../../../Utils/expect.dart";

RegExp alphabet = new RegExp("[A-Za-z0-9_=-]");

check(Base64Encoder encoder, List<int> toEncode) {
  String encoded = encoder.convert(toEncode);
  Expect.listEquals(toEncode, base64.decode(encoded));

  for (int i = 0; i < encoded.length - 1; i++) {
    String char = encoded.substring(i, i + 1);
    Expect.isTrue(alphabet.hasMatch(char), "Wrong character " + char);
  }
}

main() {
  Base64Encoder encoder = new Base64Encoder.urlSafe();
  for (int i = 0; i < 256; i++) {
    check(encoder, [i]);
  }
}
