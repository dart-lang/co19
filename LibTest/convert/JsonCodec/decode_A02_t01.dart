/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Object decode(String str, {reviver(key, value)})
 * The optional reviver function is called once for each object or list property
 * that has been parsed during decoding.
 * The key argument is either the integer list index for a list property,
 * the map string for object properties, or null for the final result.
 * The default reviver (when not provided) is the identity function.
 * @description Checks that reviver function, if provided, is called at least
 * once for each object or list property parsed.
 * @author kaigorodov
 */
import "dart:convert";
import "../../../Utils/expect.dart";
import "../JsonDecoder/table1.lib.dart" show table;

int count = 0;

Object reviver(key, value) {
   ++count;
   return value;
}

main() {
  for (List<Object> pair in table) {
    Object jsonObject = pair[0];
    String jsonString = pair[1];
    Object res = new JsonCodec().decode(jsonString, reviver: reviver);
    Expect.deepEquals(jsonObject, res);
    Expect.isTrue(count > 0);
    count = 0;
  }
}
