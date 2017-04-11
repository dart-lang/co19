/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Utf8Decoder decoder
 * @description Checks that this property returns Utf8Decoder which works as
 * expected
 * @author sgrekhov@unipro.ru
 */
import "dart:convert";
import "../../../Utils/expect.dart";

check(Utf8Decoder decoder, List<int> toDecode, var expected) {
  var decoded = decoder.convert(toDecode);
  Expect.equals(expected, decoded);
}

main() {
  Utf8Codec codec = new Utf8Codec();
  Expect.isNotNull(codec.decoder);

  for (int i = 0; i < 128; i++) {
    String s = new String.fromCharCode(i);
    check(codec.decoder, [i], s);
  }
  check(codec.decoder, [208, 154, 208, 184, 209, 128, 208, 184, 208, 187, 208, 187, 208,
    184, 209, 134, 208, 176, 32], "Кириллица ");
}
