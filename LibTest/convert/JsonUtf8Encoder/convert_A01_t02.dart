/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion List<int> convert(Object object)
 * Convert object into UTF-8 encoded JSON.
 * @description Checks that objects are converted into UTF-8 encoded JSON by
 * calling their toJson() method
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

check(JsonUtf8Encoder encoder, var object, var expected) {
  var encoded = encoder.convert(object);
  Expect.listEquals(utf8.encode(expected.toString()), encoded);
}

main() {
  JsonUtf8Encoder encoder = new JsonUtf8Encoder();

  check(encoder, new A(), new A().toJson());
  check(encoder, new C(), '"' + new C().toJson() + '"');
}
