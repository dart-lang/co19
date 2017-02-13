/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion const JsonCodec({dynamic reviver(key,value),
 * dynamic toEncodable(object)})
 * Creates a JsonCodec with the given reviver and encoding function.
 * ...
 * If reviver is omitted, it defaults to returning the value argument.
 * ...
 * If toEncodable is omitted, it defaults to a function that returns the result
 * of calling .toJson() on the unencodable object.
 * @description Checks that this constructor, called without parameters,
 * created object with default reviver and toEncodable
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

checkReviver(JsonCodec codec, String toDecode, var expected) {
  var decoded = codec.decode(toDecode);
  Expect.deepEquals(expected, decoded);
}

checkEncodable(JsonCodec codec, var object, var expected) {
  var encoded = codec.encode(object);
  Expect.equals(expected.toString(), encoded.toString());
}

main() {
  JsonCodec codec = new JsonCodec();

  checkReviver(codec, '{"a": 3}', {"a": 3});
  checkReviver(codec, '{"b": 3.14}', {"b": 3.14});
  checkReviver(codec, '{"c": true}', {"c": true});
  checkReviver(codec, '["d", "e"]', ["d", "e"]);
  checkReviver(codec, '{"f": {"g": "h"}}', {"f": {"g": "h"}});

  checkEncodable(codec, new A(), new A().toJson());
  checkEncodable(codec, new C(), '"' + new C().toJson() + '"');
}
