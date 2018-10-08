/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Cogec<List<int>, R> fuse<R>(Codec<List<int>, R> other)
 * Fuses this with other.
 * When encoding, the resulting codec encodes with this before encoding with
 * other.
 * When decoding, the resulting codec decodes with other before decoding with
 * this.
 * In some cases one needs to use the inverted codecs to be able to fuse them
 * correctly. That is, the output type of this (List<int>) must match the input
 * type of the second codec other.
 * @description Checks that encoding with the resulting converter is equivalent
 * to converting with this before converting with other.
 * @author ngl@unipro.ru
 */
import "dart:convert";
import "dart:io";
import "../../../Utils/expect.dart";

void check(Codec fused, List<int> expectedData) {
  Expect.listEquals(expectedData, fused.encode(expectedData));
  Expect.listEquals(expectedData, fused.decode(expectedData));
}

main() {
  ZLibCodec codec = new ZLibCodec();
  Codec inverted = codec.inverted;
  Codec fused = codec.fuse(inverted);

  for (int i = 0; i < 10; i++) {
    List<int> data = new List.generate(i, (int i) => i);
    check(fused, data);
  }
  check(fused, []);
}
