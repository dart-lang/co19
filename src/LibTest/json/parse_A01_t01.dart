/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion dynamic parse(String json, [reviver(key, value)])
 * Parses json and build the corresponding parsed JSON value.
 * Parsed JSON values are of the types num, String, bool, Null, Lists of parsed
 * JSON values or Maps from String to parsed JSON values.
 * @description Checks that num, String, bool, Null, List, and Map values
 * are parsed correctly.
 * @author kaigorodov
 */
import "../../Utils/expect.dart";
import "dart:json";
import "stringify_A01_t01.dart" show table;

main() {
  for (List<Object> pair in table) {
    Object res = parse(pair[1]);
    Expect.deepEquals(pair[0], res);
  }
}