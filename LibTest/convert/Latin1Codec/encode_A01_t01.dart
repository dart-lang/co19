/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion T encode(S input)
 * @description Checks that this method encodes strings to Latin1 code units
 * @author sgrekhov@unipro.ru
 */
import "dart:convert";
import "../../../Utils/expect.dart";

main() {
  Latin1Codec codec = new Latin1Codec();
  for (int i = 0; i < 256; i++) {
    String s = new String.fromCharCode(i);
    Expect.listEquals([i], codec.encode(s));
  }
  Expect.listEquals([], codec.encode(""));
}
