/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion String stringify(Object object)
 * If the object does not support "toJson()" method, throws, or returns a value that is not directly serializable,
 * a JsonUnsupportedObjectError exception is thrown.
 * If the call throws (including the case where there is no nullary "toJson" method,
 * the error is caught and stored in the JsonUnsupportedObjectError's cause field.
 * @description Checks that if the object does not support "toJson()" method,
 * a JsonUnsupportedObjectError exception is thrown,
 * and JsonUnsupportedObjectError's cause field is filled.
 * @note variable table in this test is used also in the test printOn_A03_t01.
 * @author kaigorodov
 */
import "../../Utils/expect.dart";
import "dart:json";

class S1 {
  Object a;
  Object b;
  
  S1(this.a, this.b);
}

class S2 {
  Object a;
  Object b;
  
  S2(this.a, this.b);
}

List<Object> table=[
  new S1(1234, "1234"),
  new S1(null, []),
  new S1(1.234, {}),
  new S2("1.234", {}),
  new S2("key2", [null, 1.0])
];

main() {
  bool failed=false;
  for (Object obj in table) {
    try {
      String res=stringify(obj);
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
