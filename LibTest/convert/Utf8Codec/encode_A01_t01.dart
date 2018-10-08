/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion T encode(S input)
 * @description Checks that this method encodes  strings to utf-8 code units
 * @author sgrekhov@unipro.ru
 */
import "dart:convert";
import "../../../Utils/expect.dart";

main() {
  Utf8Codec codec = new Utf8Codec();
  for (int i = 0; i < 128; i++) {
    String s = new String.fromCharCode(i);
    Expect.listEquals([i], codec.encode(s));
  }

  Expect.listEquals([208, 154, 208, 184, 209, 128, 208, 184, 208, 187, 208, 187,
    208, 184, 209, 134, 208, 176, 32], codec.encode("Кириллица "));
}
