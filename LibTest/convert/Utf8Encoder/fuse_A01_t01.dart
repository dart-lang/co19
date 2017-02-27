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

check(Converter codec, String toEncode) {
  Expect.equals(toEncode, codec.convert(toEncode));
}

main() {
  Utf8Encoder encoder = new Utf8Encoder();
  Converter fused = encoder.fuse(new Utf8Codec().decoder);

  for (int i = 0; i < 128; i++) {
    check(fused, new String.fromCharCode(i));
  }
  check(fused, "Кириллица прекрасна");
}
