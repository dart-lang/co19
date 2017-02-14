/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Object convert(String input)
 * Converts the given JSON-string input to its corresponding object.
 * Parsed JSON values are of the types num, String, bool, Null, Lists of parsed
 * JSON values or Maps from String to parsed JSON values.
 * @description Checks that num, String, bool, Null, List, and Map values
 * are parsed correctly.
 * @author kaigorodov
 */
import "dart:convert";
import "../../../Utils/expect.dart";
import "table1.lib.dart" show table;

main() {
  for (List<Object> pair in table) {
    JsonDecoder jdec = new JsonDecoder(null);
    Object res = jdec.convert(pair[1]);
    Expect.deepEquals(pair[0], res);
  }
}
