/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion AsciiEncoder encoder
 * @description Checks that this property returns AsciiEncoder which works as
 * expected
 * @author sgrekhov@unipro.ru
 */
import "dart:convert";
import "../../../Utils/expect.dart";

check(AsciiEncoder encoder, String toEncode, List<int> expected) {
  var encoded = encoder.convert(toEncode);
  Expect.listEquals(expected, encoded);
}

main() {
  AsciiCodec codec = new AsciiCodec();
  Expect.isNotNull(codec.encoder);

  for (int i = 0; i < 128; i++) {
    String s = new String.fromCharCode(i);
    check(codec.encoder, s, [i]);
  }
  check(codec.encoder, "", []);
}
