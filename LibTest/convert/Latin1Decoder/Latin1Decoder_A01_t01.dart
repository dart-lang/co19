/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion const Latin1Decoder({bool allowInvalid: false})
 * Instantiates a new Latin1Decoder.
 *
 * The optional allowInvalid argument defines how convert deals with invalid
 * bytes.
 *
 * If it is true, convert replaces invalid bytes with the Unicode Replacement
 * character U+FFFD (�). Otherwise it throws a FormatException.
 *
 * @description Checks that this constructor creates valid Latin1Decoder
 * @author sgrekhov@unipro.ru
 */
import "dart:convert";
import "../../../Utils/expect.dart";

main() {
  Latin1Decoder decoder = new Latin1Decoder();
  for (int i = 0; i < 256; i++) {
    String s = new String.fromCharCode(i);
    Expect.equals(s, decoder.convert([i]));
  }
  for (int i = 256; i < 65536; i++) {
    Expect.throws(() {decoder.convert([i]);}, (e) => e is FormatException);
  }

  decoder = new Latin1Decoder(allowInvalid: false);
  for (int i = 0; i < 256; i++) {
    String s = new String.fromCharCode(i);
    Expect.equals(s, decoder.convert([i]));
  }
  for (int i = 256; i < 65536; i++) {
    Expect.throws(() {decoder.convert([i]);}, (e) => e is FormatException);
  }
}
