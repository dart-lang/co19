/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion String decode(List<int> bytes, {bool allowInvalid})
 * Decodes the Latin-1 bytes (a list of unsigned 8-bit integers) to the
 * corresponding string.
 * ...
 * @description Checks that this method decodes the Latin-1 bytes (a list of
 * unsigned 8-bit integers) to the corresponding string. Test allowInvalid
 * @author sgrekhov@unipro.ru
 */
import "dart:convert";
import "../../../Utils/expect.dart";

check(Latin1Decoder decoder, List<int> toDecode, var expected) {
  var decoded = decoder.convert(toDecode);
  Expect.equals(expected, decoded);
}

main() {
  Latin1Codec codec = new Latin1Codec(allowInvalid: true);
  for (int i = 0; i < 256; i++) {
    check(codec.decoder, [i], new String.fromCharCode(i));
  }
  for (int i = 256; i <= 65536; i++) {
    check(codec.decoder, [i], "�");
  }
}
