/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Object encode(Object value, {toEncodable(object)})
 * Converts value to a JSON string.
 * If value contains objects that are not directly encodable to a JSON string
 * (a value that is not a number, boolean, string, null, list or a map with
 * string keys), the toEncodable function is used to convert it to an object
 * that must be directly encodable.
 * If toEncodable is omitted, it defaults to calling .toJson() on the
 * unencodable object.
 * @description Checks that if a value is any other type than num, String, bool,
 * Null, List, or Map, a "toJson()" method is invoked on the object and the
 * result, which must be a directly serializable value, is serialized instead of
 * the original value.
 * @author kaigorodov
 */
import "../../../Utils/expect.dart";
import "dart:convert";

class S1 {
  Object a;
  Object b;
  
  S1(this.a, this.b);
  
  List toJson() {
    return [a, b];
  }
}

class S2 {
  Object a;
  Object b;
  
  S2(this.a, this.b);
  
  Map toJson() {
    return {a: b};
  }
}

List<List<Object>> table = [
  [new S1(1234, "1234"), '[1234,"1234"]'],
  [new S1(null, []), '[null,[]]'],
  [new S1(1.234, {}), '[1.234,{}]'],
  [new S2("1.234", {}), '{"1.234":{}}'],
  [new S2("key2", [null, 1.0]),
   '{"key2":[null,1.0]}'],
];

main() {
  JsonCodec codec = new JsonCodec();

  for (List<Object> pair in table) {
    String res = codec.encode(pair[0]);
    Expect.equals(pair[1], res);
  }
}
