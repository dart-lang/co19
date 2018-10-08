/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion List<int> dictionary
 *  final
 *  Initial compression dictionary.
 * It should consist of strings (byte sequences) that are likely to be
 * encountered later in the data to be compressed, with the most commonly used
 * strings preferably put towards the end of the dictionary. Using a dictionary
 * is most useful when the data to be compressed is short and can be predicted
 * with good accuracy; the data can then be compressed better than with the
 * default empty dictionary.
 * @description Checks that this property returns initial compression dictionary
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
  Expect.isNull(codec.dictionary);
  ZLibEncoder encoder = new ZLibEncoder();
  for (int i = 0; i < 256; i++) {
    var encoded = encoder.convert([i]);
    check(codec.decoder, encoded, [i]);
  }
  check(codec.decoder, [], []);

  codec = new GZipCodec(dictionary: [1, 2, 3]);
  Expect.listEquals([1, 2, 3], codec.dictionary);
  Expect.isNotNull(codec.decoder);

  for (int i = 0; i < 256; i++) {
    var encoded = encoder.convert([i]);
    check(codec.decoder, encoded, [i]);
  }
  check(codec.decoder, [], []);
}
