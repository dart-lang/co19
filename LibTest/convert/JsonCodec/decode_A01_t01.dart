/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Object decode(String str, {reviver(key, value)})
 * Parses the string and returns the resulting Json object.
 * @description Checks that num, String, bool, Null, List, and Map values
 * are parsed correctly.
 * @author kaigorodov
 */
import "dart:convert";
import "../../../Utils/expect.dart";
import "../JsonDecoder/table1.lib.dart" show table;

main() {
  for (List<Object> pair in table) {
    Object res = new JsonCodec().decode(pair[1]);
    Expect.deepEquals(pair[0], res);
  }
}
