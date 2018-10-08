/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion List<int> convert(Object object)
 * Convert object into UTF-8 encoded JSON.
 * @description Checks that if the object does not support "toJson()" method,
 * then an exception is thrown
 * @author sgrekhov@unipro.ru
 */
import "dart:convert";
import "../../../Utils/expect.dart";
import "../JsonEncoder/table2.lib.dart";

main() {
  for (Object obj in table) {
    Expect.throws(() {
      JsonUtf8Encoder enc = new JsonUtf8Encoder();
      enc.convert(obj);
    });
  }
}
