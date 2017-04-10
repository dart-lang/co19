/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion const Latin1Encoder()
 * @description Checks that this constructor created valid Latin1Encoder
 * @author sgrekhov@unipro.ru
 */
import "dart:convert";
import "../../../Utils/expect.dart";

check(Latin1Encoder encoder, String toEncone, List<int> expected) {
  var encoded = encoder.convert(toEncone);
  Expect.listEquals(expected, encoded);
}

main() {
  Latin1Encoder encoder = new Latin1Encoder();
  for (int i = 0; i < 256; i++) {
    check(encoder, new String.fromCharCode(i), [i]);
  }
  check(encoder, "", []);
}
