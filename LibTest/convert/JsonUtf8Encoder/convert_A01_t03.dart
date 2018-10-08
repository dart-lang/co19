/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion List<int> convert(Object object)
 * Convert object into UTF-8 encoded JSON.
 * @description Checks that objects are converted into UTF-8 encoded JSON by
 * calling their toEncodable
 * @author sgrekhov@unipro.ru
 */
import "dart:convert";
import "../../../Utils/expect.dart";
import "../JsonDecoder/table1.lib.dart";

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

check(JsonUtf8Encoder encoder, var object, var expected) {
  List<int> encoded = encoder.convert(object);
  Expect.listEquals(utf8.encode(expected), encoded);
}

main() {
  JsonUtf8Encoder encoder = new JsonUtf8Encoder(null, toEncodable);

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
