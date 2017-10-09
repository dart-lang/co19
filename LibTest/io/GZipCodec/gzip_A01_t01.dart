/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool gzip
 *  final
 * When true, GZip frames will be added to the compressed data.
 * @description Checks that this property returns constructor's gzip argument
 * @author sgrekhov@unipro.ru
 * @issue 31024
 */
import "dart:io";
import "../../../Utils/expect.dart";

check(ZLibDecoder decoder, List<int> toDecode, List<int> expected) {
  var decoded = decoder.convert(toDecode);
  Expect.listEquals(expected, decoded);
}

main() {
  GZipCodec codec = new GZipCodec();
  Expect.isTrue(codec.gzip);
  ZLibEncoder encoder = new ZLibEncoder();

  for (int i = 0; i < 256; i++) {
    var encoded = encoder.convert([i]);
    check(codec.decoder, encoded, [i]);
  }

  codec = new GZipCodec(gzip: false);
  Expect.isFalse(codec.gzip);

  Expect.isNotNull(codec.decoder);

  for (int i = 0; i < 256; i++) {
    var encoded = encoder.convert([i]);
    check(codec.decoder, encoded, [i]);
  }
  check(codec.decoder, [], []);
}
