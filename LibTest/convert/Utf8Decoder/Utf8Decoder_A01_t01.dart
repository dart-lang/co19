/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion const Utf8Decoder({bool allowMalformed: false})
 * Instantiates a new Utf8Decoder.
 *
 * @description Checks that this constructor creates valid Utf8Decoder
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

  decoder = new Utf8Decoder(allowMalformed: false);
  for (int i = 0; i < 128; i++) {
    String s = new String.fromCharCode(i);
    Expect.equals(s, decoder.convert([i]));
  }
  Expect.equals("Кириллица ", decoder.convert([208, 154, 208, 184, 209, 128,
    208, 184, 208, 187, 208, 187, 208, 184, 209, 134, 208, 176, 32]));
}
