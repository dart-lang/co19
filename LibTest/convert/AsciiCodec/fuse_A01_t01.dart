/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Codec<S, R> fuse<R>(Codec<T, R> other)
 * Fuses this with other.
 *
 * When encoding, the resulting codec encodes with this before encoding with
 * other.
 *
 * When decoding, the resulting codec decodes with other before decoding with
 * this.
 * @description Checks that encoding with the resulting converter is equivalent
 * to converting with this before converting with other.
 * @author sgrekhov@unipro.ru
 */
import "dart:convert";
import "../../../Utils/expect.dart";

check(Codec codec, String toEncode) {
  Expect.equals(toEncode, codec.decode(toEncode));
  Expect.equals(toEncode, codec.encode(toEncode));
}

main() {
  AsciiCodec codec = new AsciiCodec();
  Codec inverted = codec.inverted;
  Codec fused = codec.fuse(inverted);

  check(fused, r"Some string 123 !@#$%^&*()_+|");
  check(fused, "");
  Expect.throws(() {check(fused, "Non-ASCII: Кириллица");});
}
