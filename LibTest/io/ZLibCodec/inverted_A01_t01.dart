/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion  Codec<T, S> inverted
 * Inverts this.
 * The encoder and decoder of the resulting codec are swapped.
 * @description Checks that the encoder and decoder of the resulting codec are
 * swapped
 * @author ngl@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";

main() {
  var codec = new ZLibCodec();
  var inverted = codec.inverted;

  Expect.isTrue(inverted.encoder is ZLibDecoder);
  Expect.isTrue(inverted.decoder is ZLibEncoder);
}
