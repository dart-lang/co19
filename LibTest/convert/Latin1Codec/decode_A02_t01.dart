/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion String decode(List<int> bytes, {bool allowInvalid})
 * Decodes the Latin-1 bytes (a list of unsigned 8-bit integers) to the
 * corresponding string.
 *
 * If bytes contains values that are not in the range 0 .. 255, the decoder will
 * eventually throw a FormatException.
 * ...
 * @description Checks that if bytes contains values that are not in the range
 * 0 .. 255, the decoder will eventually throw a FormatException.
 * @author sgrekhov@unipro.ru
 */
import "dart:convert";
import "../../../Utils/expect.dart";

main() {
  Latin1Codec codec = new Latin1Codec();
  for (int i = 256; i < 65536; i++) {
    Expect.throws(() {codec.decode([i]);}, (e) => e is FormatException);
  }

  codec = new Latin1Codec(allowInvalid: true);
  for (int i = 256; i < 65536; i++) {
    Expect.throws(() {codec.decode([i], allowInvalid: false);},
        (e) => e is FormatException);
  }
}
