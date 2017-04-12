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
 *
 * In some cases one needs to use the inverted codecs to be able to fuse them
 * correctly. That is, the output type of this (T) must match the input type of
 * the second codec other.
 * @description Checks that encoding with the resulting converter is equivalent
 * to converting with this before converting with other.
 * @author sgrekhov@unipro.ru
 */
import "dart:convert";
import "../../../Utils/expect.dart";

check(Encoding encoding, String toEncode) {
  Codec inverted = encoding.inverted;
  Codec fused = encoding.fuse(inverted);
  Expect.equals(toEncode, fused.decode(toEncode));
  Expect.equals(toEncode, fused.encode(toEncode));
}

main() {
  check(Encoding.getByName("us-ascii"), "123abs-");
  check(Encoding.getByName("iso-8859-1"), "âã");
  check(Encoding.getByName("utf-8"), "Кириллица прекрасна");
}
