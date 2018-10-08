/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion const JsonEncoder([Object toEncodable(Object nonSerializable)])
 * Creates a JSON encoder.
 * The JSON encoder handles numbers, strings, booleans, null, lists and maps
 * directly.
 * Any other object is attempted converted by toEncodable to an object that is
 * of one of the convertible types.
 * @description Checks that this constructor, called with toEncodable parameter,
 * handles numbers, strings, booleans, null, lists and maps
 * @author sgrekhov@unipro.ru
 */
import "dart:convert";
import "../../../Utils/expect.dart";

class A {
  Object toJson() => 42;
}

class C {
  String toJson() => "C: this is JSON";
}

dynamic toEncodable(object) {
  if (object is A) {
    return "A encoded by toEncodable";
  }
  if (object is C) {
    return "C encoded by toEncodable";
  }
  return "Another encoded by toEncodable";
}

check(JsonEncoder encoder, var object, var expected) {
  String encoded = encoder.convert(object);
  Expect.equals(expected, encoded);
}

main() {
  JsonEncoder encoder = new JsonEncoder(toEncodable);

  check(encoder, 1, "1");
  check(encoder, 3.14, "3.14");
  check(encoder, null, "null");
  check(encoder, "str", '"str"');
  check(encoder, true, 'true');
  check(encoder, false, 'false');
  check(encoder, [1, 2, 3], "[1,2,3]");
  check(encoder, {"a": "b"}, '{"a":"b"}');
  check(encoder, new A(), '"A encoded by toEncodable"');
  check(encoder, new C(), '"C encoded by toEncodable"');
  check(encoder, [new C(), new A()],
      '["C encoded by toEncodable","A encoded by toEncodable"]');
  // Map with not a string keys
  check(
      encoder, {new C(): new A()}, '"Another encoded by toEncodable"');

  // Map with a string keys
  check(encoder, {"x": new A()}, '{"x":"A encoded by toEncodable"}');
}
