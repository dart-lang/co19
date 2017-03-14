/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion const AsciiEncoder()
 * @description Checks that this constructor created valid AsciiEncoder
 * @author sgrekhov@unipro.ru
 */
import "dart:convert";
import "../../../Utils/expect.dart";

check(AsciiEncoder encoder, String toEncone, List<int> expected) {
  var encoded = encoder.convert(toEncone);
  Expect.listEquals(expected, encoded);
}

main() {
  AsciiEncoder encoder = new AsciiEncoder();
  for (int i = 0; i < 128; i++) {
    check(encoder, new String.fromCharCode(i), [i]);
  }
  check(encoder, "", []);
}
