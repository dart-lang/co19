/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Base64Encoder encoder
 * @description Checks that this property returns Base64Encoder which works as
 * expected
 * @author sgrekhov@unipro.ru
 */
import "dart:convert";
import "../../../Utils/expect.dart";

check(Base64Encoder encoder, List<int> toEncode, String expected) {
  String encoded = encoder.convert(toEncode);
  Expect.equals(expected, encoded);
}

main() {
  Base64Codec codec = new Base64Codec();
  Expect.isNotNull(codec.encoder);

  for (int i = 0; i < 256; i++) {
    List<int> toEncode = [i];
    check(codec.encoder, [i], codec.encode([i]));
  }
}
