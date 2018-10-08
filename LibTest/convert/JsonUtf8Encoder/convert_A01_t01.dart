/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion List<int> convert(Object object)
 * Convert object into UTF-8 encoded JSON.
 * @description Checks that num, String, bool, Null, List, and Map values are
 * converted into UTF-8 encoded JSON.
 * @author sgrekhov@unipro.ru
 */
import "dart:convert";
import "../../../Utils/expect.dart";
import "../JsonDecoder/table1.lib.dart";

main() {
  for (List<Object> pair in table) {
    JsonUtf8Encoder enc = new JsonUtf8Encoder();
    List<int> res = enc.convert(pair[0]);
    Expect.listEquals(utf8.encode(pair[1]), res);
  }
}
