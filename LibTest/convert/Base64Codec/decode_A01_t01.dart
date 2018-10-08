/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion S decode(T encoded)
 * @description Checks that this method decodes data to base 64 string
 * @author sgrekhov@unipro.ru
 */
import "dart:convert";
import "../../../Utils/expect.dart";

check(Base64Codec codec, List<int> toEncode) {
  String encoded = codec.encode(toEncode);
  Expect.listEquals(toEncode, codec.decode(encoded));
}

main() {
  Base64Codec codec = new Base64Codec();
  for (int i = 0; i < 256; i++) {
    check(codec, [i]);
  }
}
