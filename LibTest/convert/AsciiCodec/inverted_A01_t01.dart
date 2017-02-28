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

main() {
  AsciiCodec codec = new AsciiCodec();
  Codec inverted = codec.inverted;
  Expect.isTrue(inverted.decoder is AsciiEncoder);
  Expect.isTrue(inverted.encoder is AsciiDecoder);
}
