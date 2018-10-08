/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Object encode(Object value, {toEncodable(object)})
 * Converts value to a JSON string.
 * If value contains objects that are not directly encodable to a JSON string
 * (a value that is not a number, boolean, string, null, list or a map with
 * string keys), the toEncodable function is used to convert it to an object
 * that must be directly encodable.
 * @description Checks that num, String, bool, Null, List, and Map values are
 * serialized correctly.
 * @note variable table in this test is used also in the test decode_A01_t01.
 * @author kaigorodov
 */
import "dart:convert";
import "../../../Utils/expect.dart";
import "../JsonDecoder/table1.lib.dart" show table;

main() {
  for (List<Object> pair in table) {
    String res = new JsonCodec().encode(pair[0]);
    Expect.equals(pair[1], res);
  }
}
