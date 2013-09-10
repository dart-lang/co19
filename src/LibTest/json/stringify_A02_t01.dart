/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion String stringify(Object object)
 * If a value is any other type is attempted serialized, a "toJson()" method
 * is invoked on the object and the result, which must be a directly serializable value,
 * is serialized instead of the original value.
 * If the object does not support this method, throws, or returns a value that is not directly serializable,
 * a JsonUnsupportedObjectError exception is thrown.
 * @description Checks that if a value is any other type than num, String, bool, Null, List, or Map,
 * a "toJson()" method is invoked on the object and the result, which must be a directly serializable value,
 * is serialized instead of the original value.
 * @note variable table in this test is used also in the test printOn_A02_t01.
 * @author kaigorodov
 */
import "../../Utils/expect.dart";
import "dart:json";

class S1 {
  Object a;
  Object b;
  
  S1(this.a, this.b);
  
  List toJson() {
    return [a,b];
  }
}

class S2 {
  Object a;
  Object b;
  
  S2(this.a, this.b);
  
  Map toJson() {
    return {a:b};
  }
}

List<List<Object>> table=[
  [new S1(1234, "1234"), '[1234,"1234"]'],
  [new S1(null, []), '[null,[]]'],
  [new S1(1.234, {}), '[1.234,{}]'],
  [new S2("1.234", {}), '{"1.234":{}}'],
  [new S2("key2", [null, 1.0]),
   '{"key2":[null,1.0]}'],
];

main() {
  for (List<Object> pair in table) {
    String res=stringify(pair[0]);
    Expect.equals(pair[1], res);
  }
}
