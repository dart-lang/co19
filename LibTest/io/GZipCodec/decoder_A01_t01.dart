/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion ZLibDecoder decoder
 * Get a ZLibDecoder for decoding GZip compressed data.
 * @description Checks that this property returns ZLibDecoder which works as
 * expected
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";

check(ZLibDecoder decoder, List<int> toDecode, List<int> expected) {
  var decoded = decoder.convert(toDecode);
  Expect.listEquals(expected, decoded);
}

main() {
  GZipCodec codec = new GZipCodec();
  Expect.isNotNull(codec.decoder);

  ZLibEncoder encoder = new ZLibEncoder();
  for (int i = 0; i < 256; i++) {
    var encoded = encoder.convert([i]);
    check(codec.decoder, encoded, [i]);
  }
  check(codec.decoder, [], []);
}
