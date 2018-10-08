/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion ZLibDecoder decoder
 * Get a ZLibDecoder for decoding ZLib compressed data.
 * @description Checks that the returned value is a ZLibDecoder for decoding
 * ZLib compressed data.
 * @author ngl@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";

main() {
  ZLibCodec codec = new ZLibCodec();
  ZLibDecoder decoder = codec.decoder;
  ZLibEncoder encoder = new ZLibEncoder();
  Expect.isTrue(decoder is ZLibDecoder);

  List<int> data = [1, 2, 3];
  List<int> encodedData = encoder.convert(data);
  Expect.listEquals(data, decoder.convert(encodedData));
}
