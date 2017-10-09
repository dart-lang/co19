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
import "dart:io";
import "dart:convert";
import "../../../Utils/expect.dart";

main() {
  GZipCodec codec = new GZipCodec();
  Codec inverted = codec.inverted;

  int max = 1000;
  List<int> data = new List<int>(max);
  for (int i = 0; i < max; i++) {
    data[i] = i % 256;
  }
  List<int> transformed = codec.inverted. encoder.convert(codec.encoder.convert(data));
  Expect.listEquals(data, transformed);
}
