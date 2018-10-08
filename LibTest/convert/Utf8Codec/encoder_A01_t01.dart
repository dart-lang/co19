/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Utf8Encoder encoder
 * @description Checks that this property returns Utf8Encoder which works as
 * expected
 * @author sgrekhov@unipro.ru
 */
import "dart:convert";
import "../../../Utils/expect.dart";

check(Utf8Encoder encoder, String toEncode, List<int> expected) {
  var encoded = encoder.convert(toEncode);
  Expect.listEquals(expected, encoded);
}

main() {
  Utf8Codec codec = new Utf8Codec();
  Expect.isNotNull(codec.encoder);

  for (int i = 0; i < 128; i++) {
    String s = new String.fromCharCode(i);
    check(codec.encoder, s, [i]);
  }
  check(codec.encoder, "Кириллица ", [208, 154, 208, 184, 209, 128, 208, 184,
    208, 187, 208, 187, 208, 184, 209, 134, 208, 176, 32]);
}
