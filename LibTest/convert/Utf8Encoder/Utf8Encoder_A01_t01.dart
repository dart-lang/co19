/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion const Utf8Encoder()
 * @description Checks that this constructor created valid Utf8Encoder
 * @author sgrekhov@unipro.ru
 */
import "dart:convert";
import "../../../Utils/expect.dart";

check(Utf8Encoder encoder, String toEncone, List<int> expected) {
  var encoded = encoder.convert(toEncone);
  Expect.listEquals(expected, encoded);
}

main() {
  Utf8Encoder encoder = new Utf8Encoder();
  for (int i = 0; i < 128; i++) {
    check(encoder, new String.fromCharCode(i), [i]);
  }
  check(encoder, "", []);
  check(encoder, "Кириллица ", [208, 154, 208, 184, 209, 128, 208, 184, 208,
    187, 208, 187, 208, 184, 209, 134, 208, 176, 32]);
}
