/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion JsonDecoder decoder
 * @description Checks that this property returns JsonDecoder which works as
 * expected
 * @author sgrekhov@unipro.ru
 */
import "dart:convert";
import "../../../Utils/expect.dart";
import "../JsonDecoder/table1.lib.dart" show table;

main() {
  for (List<Object> pair in table) {
    JsonCodec codec = new JsonCodec();
    Expect.isNotNull(codec.decoder);

    Object res = codec.decoder.convert(pair[1]);
    Expect.deepEquals(pair[0], res);
  }
}
