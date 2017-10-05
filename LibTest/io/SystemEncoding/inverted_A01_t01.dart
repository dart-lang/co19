/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
import 'dart:convert';
/**
 * @assertion Codec<T, S> inverted
 *  Inverts this.
 *  The encoder and decoder of the resulting codec are swapped.
 * @description Checks that [inverted] return codec with swapped encoder
 * and decoder
 * @author a.semenov@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";

main() {
  const SystemEncoding systemEncoding = const SystemEncoding();
  Codec inverted = systemEncoding.inverted;
  Expect.equals(systemEncoding.decoder, inverted.encoder);
  Expect.equals(systemEncoding.encoder, inverted.decoder);
}
