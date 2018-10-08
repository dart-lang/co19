/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion String convert(Object o)
 * Converts the given object o to its JSON representation.
 * Directly serializable values are num, String, bool, and Null, as well as some
 * List and Map values. For List, the elements must all be serializable. For
 * Map, the keys must be String and the values must be serializable. If a value
 * is any other type is attempted serialized, the conversion function provided
 * in the constructor is invoked with the object as argument and the result,
 * which must be a directly serializable value, is serialized instead of the
 * original value.

 * If the conversion throws, or returns a value that is not directly
 * serializable, a JsonUnsupportedObjectError exception is thrown.
 * If the call throws, the error is caught and stored in the
 * JsonUnsupportedObjectError's cause field.

 * If a List or Map contains a reference to itself, directly or through other
 * lists or maps, it cannot be serialized and a JsonCyclicError is thrown.

 * Json Objects should not change during serialization.
 * If an object is serialized more than once, stringify is allowed to cache the
 * JSON text for it. I.e., if an object changes after it is first serialized,
 * the new values may or may not be reflected in the result.
 * @description Checks that num, String, bool, Null, List, and Map values are
 * serialized correctly.
 * @author kaigorodov
 */
import "dart:convert";
import "../../../Utils/expect.dart";
import "../JsonDecoder/table1.lib.dart";

main() {
  for (List<Object> pair in table) {
    JsonEncoder enc = new JsonEncoder();
    String res = enc.convert(pair[0]);
    Expect.equals(pair[1], res);
  }
}
