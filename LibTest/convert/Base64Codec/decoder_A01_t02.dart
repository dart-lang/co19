/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Base64Decoder decoder
 * @description Checks that this property returns Base64Decoder which works as
 * expected. Test URL safe codec
 * @author sgrekhov@unipro.ru
 */
import "dart:convert";
import "../../../Utils/expect.dart";

check(Base64Decoder decoder, String toDecode, var expected) {
  List<int> decoded = decoder.convert(toDecode);
  Expect.listEquals(expected, decoded);
}

main() {
  Base64Codec codec = new Base64Codec.urlSafe();
  Expect.isNotNull(codec.decoder);

  for (int i = 0; i < 256; i++) {
    check(codec.decoder, codec.encode([i]), [i]);
  }
}
