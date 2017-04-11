/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Codec<T, S> inverted
 * Inverts this.
 *
 * The encoder and decoder of the resulting codec are swapped.
 * @description Checks that this property returns new codec with swapped encoder
 * and decoder
 * @author sgrekhov@unipro.ru
 */
import "dart:convert";
import "../../../Utils/expect.dart";

check(Encoding encoding) {
  Codec inverted = encoding.inverted;
  Expect.equals(inverted.encoder.convert([0x31, 0x32, 0x33, 0x61, 0x62, 0x63]),
      "123abc");
  Expect.listEquals(inverted.decoder.convert("123abc"),
      [0x31, 0x32, 0x33, 0x61, 0x62, 0x63]);
}

main() {
  check(Encoding.getByName("us-ascii"));
  check(Encoding.getByName("iso-8859-1"));
  check(Encoding.getByName("utf-8"));
}
