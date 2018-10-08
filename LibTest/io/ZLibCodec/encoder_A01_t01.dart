/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion ZLibEncoder encoder
 * Get a ZLibEncoder for encoding ZLib compressed data.
 * @description Checks that the returned value is a ZLibEncoder for encoding
 * ZLib compressed data.
 * @author ngl@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";

main() {
  ZLibCodec codec = new ZLibCodec();
  ZLibEncoder encoder = codec.encoder;
  ZLibDecoder decoder = codec.decoder;

  Expect.isTrue(encoder is ZLibEncoder);

  List<int> data = [1, 2, 3];
  List<int> encodedData = encoder.convert(data);
  Expect.listEquals(data, decoder.convert(encodedData));
}
