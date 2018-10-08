/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Latin1Decoder decoder
 * @description Checks that this property returns Latin1Codec which works as
 * expected
 * @author sgrekhov@unipro.ru
 */
import "dart:convert";
import "../../../Utils/expect.dart";

check(Latin1Decoder decoder, List<int> toDecode, var expected) {
  var decoded = decoder.convert(toDecode);
  Expect.equals(expected, decoded);
}

main() {
  Latin1Codec codec = new Latin1Codec();
  Expect.isNotNull(codec.decoder);

  for (int i = 0; i < 256; i++) {
    String s = new String.fromCharCode(i);
    check(codec.decoder, [i], s);
  }
  check(codec.decoder, [], "");
  Latin1Codec codec2 = new Latin1Codec(allowInvalid: true);
  for (int i = 256; i <= 65536; i++) {
    Expect.throws(() {
      check(codec.decoder, [i], "�");
    });
    check(codec2.decoder, [i], "�");
  }
}
