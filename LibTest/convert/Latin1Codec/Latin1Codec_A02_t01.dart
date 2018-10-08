/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion const Latin1Codec({bool allowInvalid: false})
 * Instantiates a new Latin1Codec.
 * ...
 * Encoders will not accept invalid (non Latin-1) characters.
 * @description Checks that encoders will not accept invalid (non Latin-1)
 * characters.
 * @author sgrekhov@unipro.ru
 */
import "dart:convert";
import "../../../Utils/expect.dart";

check(Latin1Codec codec) {
  for (int i = 256; i <= 65536; i++) {
    String s = new String.fromCharCode(i);
    Expect.throws(() {
      codec.encode(s);
    });
  }
}

main() {
  check(new Latin1Codec());
  check(new Latin1Codec(allowInvalid: false));
}
