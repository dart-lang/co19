/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion dynamic parse(String json, [reviver(key, value)])
 * The optional reviver function, if provided, is called once for each object or
 * list property parsed.
 * The arguments are the property name (String) or list index (int),
 * and the value is the parsed value.
 * The return value of the reviver will be used as the value of that property
 * instead the parsed value.

 * Throws FormatException if the input is not valid JSON text.
 * @description Checks that reviver function, if provided, is called at least once
 * for each object or list property parsed.
 * @author kaigorodov
 */
import "../../Utils/expect.dart";
import "dart:json";
import "stringify_A01_t01.dart" show table;

int count=0;

Object reviver(key, value) {
   ++count;
   return value;
}

main() {
  for (List<Object> pair in table) {
    print("parsing ${pair[1]}...");
    Object res = parse(pair[1], reviver);
    Expect.deepEquals(pair[0], res);
    Expect.isTrue(count>0);
    count=0;
  }
}