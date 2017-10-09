/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion ZLibEncoder encoder
 * Get a ZLibEncoder for encoding to GZip compressed data.
 * @description Checks that this property returns ZLibEncoder which works as
 * expected
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";

check(ZLibEncoder encoder, List<int> toDecode, List<int> expected) {
  var encoded = encoder.convert(toDecode);
  ZLibDecoder decoder = new ZLibDecoder();
  Expect.listEquals(expected, decoder.convert(encoded));
}

main() {
  GZipCodec codec = new GZipCodec();
  Expect.isNotNull(codec.encoder);

  for (int i = 0; i < 256; i++) {
    check(codec.encoder, [i], [i]);
  }
  check(codec.encoder, [], []);
}
