/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Object convert(String input)
 * If this was initialized with a reviver, then the parsing operation invokes
 * the reviver on every object or list property that has been parsed.
 * The arguments are the property name (String) or list index (int),
 * and the value is the parsed value.
 * The return value of the reviver is used as the value of that property instead the parsed value.
 * @description Checks that num, String, bool, Null, List, and Map values
 * are parsed correctly when trivial copying reviver function used.
 * @author kaigorodov
 */
import "dart:convert";
import "../../../Utils/expect.dart";
import "table1.lib.dart" show table;

main() {
  for (List<Object> pair in table) {
    JsonDecoder jdec = new JsonDecoder((key, value) => value);
    Object res = jdec.convert(pair[1]);
    Expect.deepEquals(pair[0], res);
  }
}
