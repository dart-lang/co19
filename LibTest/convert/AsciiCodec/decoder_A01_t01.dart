/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion AsciiDecoder decoder
 * @description Checks that this property returns AsciiDecoder which works as
 * expected
 * @author sgrekhov@unipro.ru
 */
import "dart:convert";
import "../../../Utils/expect.dart";

check(AsciiDecoder decoder, List<int> toDecode, var expected) {
  var decoded = decoder.convert(toDecode);
  Expect.equals(expected, decoded);
}

main() {
  AsciiCodec codec = new AsciiCodec();
  Expect.isNotNull(codec.decoder);

  for (int i = 0; i < 128; i++) {
    String s = new String.fromCharCode(i);
    check(codec.decoder, [i], s);
  }
  check(codec.decoder, [], "");
  AsciiCodec codec2 = new AsciiCodec(allowInvalid: true);
  for (int i = 128; i <= 65536; i++) {
    Expect.throws(() {
      check(codec.decoder, [i], "�");
    });
    check(codec2.decoder, [i], "�");
  }
}
