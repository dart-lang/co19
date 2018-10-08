/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion const AsciiDecoder({bool allowInvalid: false})
 *
 * @description Checks that this constructor creates valid AsciiDecoder
 * @author sgrekhov@unipro.ru
 */
import "dart:convert";
import "../../../Utils/expect.dart";

main() {
  AsciiDecoder decoder = new AsciiDecoder();
  for (int i = 0; i < 128; i++) {
    String s = new String.fromCharCode(i);
    Expect.equals(s, decoder.convert([i]));
  }
  for (int i = 128; i < 65536; i++) {
    Expect.throws(() {decoder.convert([i]);});
  }

  decoder = new AsciiDecoder(allowInvalid: false);
  for (int i = 0; i < 128; i++) {
    String s = new String.fromCharCode(i);
    Expect.equals(s, decoder.convert([i]));
  }
  for (int i = 128; i < 65536; i++) {
    Expect.throws(() {decoder.convert([i]);});
  }
}
