/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Object encode(Object value, {toEncodable(object)})
 * If the object does not support "toJson()" method, throws, or returns a value
 * that is not directly serializable,
 * a JsonUnsupportedObjectError exception is thrown.
 * If the call throws (including the case where there is no nullary "toJson"
 * method, the error is caught and stored in the JsonUnsupportedObjectError's
 * cause field.
 * @description Checks that if "toJson()" method throws,
 * the error is caught and stored in the JsonUnsupportedObjectError's cause
 * field.
 * @author kaigorodov
 */
import "dart:convert";
import "../../../Utils/expect.dart";

class S1 {
  Object a = new Error();

  S1(this.a);

  Object toJson() {
    throw a;
  }
}

main() {
  JsonCodec codec = new JsonCodec();
  Error e1 = new Error();
  S1 s1 = new S1(e1);
  String res;
  Expect.throws(() {res = codec.encode(s1);},
      (e) => e is JsonUnsupportedObjectError && e.cause != null,
      "Error expected but result returned: $res");
}
