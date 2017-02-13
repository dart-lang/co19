/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Object encode(Object value, {toEncodable(object)})
 * If the object does not support "toJson()" method, throws, or returns a value
 * that is not directly serializable, a JsonUnsupportedObjectError exception is
 * thrown.
 * If the call throws (including the case where there is no nullary "toJson"
 * method, the error is caught and stored in the JsonUnsupportedObjectError's
 * cause field.
 * @description Checks that if the object does not support "toJson()" method,
 * a JsonUnsupportedObjectError exception is thrown,
 * and JsonUnsupportedObjectError's cause field is filled.
 * @author kaigorodov
 */
import "dart:convert";
import "../../../Utils/expect.dart";
import "../JsonEncoder/table2.lib.dart" show table;

main() {
  JsonCodec codec = new JsonCodec();
  bool failed = false;
  for (Object obj in table) {
    try {
      String res = codec.encode(obj);
      failed = true;
    } on JsonUnsupportedObjectError catch(e) {
      Expect.isNotNull(e.cause);
    }
    if (failed) {
      Expect.fail("");
    }
  }
}
