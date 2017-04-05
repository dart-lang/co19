/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Converter<S, TT> fuse<TT>(Converter<T, TT> other)
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
import "../JsonDecoder/table1.lib.dart" show table;

check(Converter encoder, List<int> toEncode) {
  Expect.listEquals(toEncode, encoder.convert(toEncode));
}

main() {
  Base64Encoder encoder = new Base64Encoder();
  Converter fused = encoder.fuse(new Base64Decoder());
  for (int i = 0; i < 256; i++) {
    check(fused, [i]);
  }
}
