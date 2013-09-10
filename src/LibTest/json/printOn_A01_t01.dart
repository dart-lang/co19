/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void printOn(Object object, StringSink output)
 * Serializes object into output stream.
 * Performs the same operations as stringify but outputs the resulting string
 * to an existing StringSink instead of creating a new String.
 * If serialization fails by throwing, some data might have been added to output,
 * but it won't contain valid JSON text.
 * @description Checks that num, String, bool, Null, List, and Map values are serialized correctly.
 * @author kaigorodov
 */
import "../../Utils/expect.dart";
import "dart:json";
import "stringify_A01_t01.dart" show table;

main() {
  for (List<Object> pair in table) {
    StringBuffer sb = new StringBuffer();
    printOn(pair[0], sb);
    String res=sb.toString();
    Expect.equals(pair[1], res);
  }
}