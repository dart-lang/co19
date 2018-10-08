/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Converter<List<int>, T> fuse<T>(Converter<String, T> next)
 * Fuses this with other.
 *
 * Encoding with the resulting converter is equivalent to converting with this
 * before converting with other.
 * @description Checks that encoding with the resulting converter is equivalent
 * to converting with this before converting with other.
 * @author sgrekhov@unipro.ru
 */
import "dart:convert";
import "../../../Utils/expect.dart";

check(Converter codec, String toDecode) {
  Expect.equals(toDecode, codec.convert(toDecode));
}

main() {
  Base64Decoder decoder = new Base64Decoder();
  Converter fused = decoder.fuse(new Base64Codec().encoder);

  for (int i = 0; i < 128; i++) {
    check(fused, base64.encode([i]));
  }
  check(fused, "");
  check(fused, "U29tZSBzdHJpbmc=");
}
