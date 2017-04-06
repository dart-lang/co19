/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Latin1Encoder encoder
 * @description Checks that this property returns Latin1Encoder which works as
 * expected
 * @author sgrekhov@unipro.ru
 */
import "dart:convert";
import "../../../Utils/expect.dart";

check(Latin1Encoder encoder, String toEncode, List<int> expected) {
  var encoded = encoder.convert(toEncode);
  Expect.listEquals(expected, encoded);
}

main() {
  Latin1Codec codec = new Latin1Codec();
  Expect.isNotNull(codec.encoder);

  for (int i = 0; i < 256; i++) {
    String s = new String.fromCharCode(i);
    check(codec.encoder, s, [i]);
  }
  check(codec.encoder, "", []);
}
