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
 * @description Checks that if a List or Map contains a reference to itself
 * directly or through other lists or maps,
 * it cannot be serialized and a JsonCyclicError is thrown.
 * @author kaigorodov
 */
import "../../Utils/expect.dart";
import "dart:json";
import "stringify_A03_t03.dart" show exc, table;

main() {
  bool failed=false;
  for (Object obj in table) {
    try {
      StringBuffer sb = new StringBuffer();
      printOn(obj, sb);
      String res=sb.toString();
      print("error expected but result returned: $res");
      failed=true;
    } on JsonUnsupportedObjectError catch(e) {
      Expect.isNotNull(e.cause);
    }
    if (failed) {
      Expect.fail("");
    }
  }
}
