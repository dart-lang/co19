/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion String convert(Object o)
 * If the conversion throws, or returns a value that is not directly
 * serializable, a JsonUnsupportedObjectError exception is thrown. If the call
 * throws, the error is caught and stored in the JsonUnsupportedObjectError's
 * cause field.

 * If a List or Map contains a reference to itself, directly or through other
 * lists or maps, it cannot be serialized and a JsonCyclicError is thrown.

 * Json Objects should not change during serialization.
 * If an object is serialized more than once, stringify is allowed to cache the
 * JSON text for it. I.e., if an object changes after it is first serialized,
 * the new values may or may not be reflected in the result.
 
 * @description Checks that if the object does not support "toJson()" method,
 * then an exception is thrown
 * @author kaigorodov
 */
import "dart:convert";
import "../../../Utils/expect.dart";
import "table2.lib.dart";

main() {
  for (Object obj in table) {
    Expect.throws(() {
      JsonEncoder enc = new JsonEncoder();
      String res = enc.convert(obj);
    });
  }
}
