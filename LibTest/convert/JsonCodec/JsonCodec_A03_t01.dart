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
 * The toEncodable function is used during encoding. It is invoked for values
 * that are not directly encodable to a string (a value that is not a number,
 * boolean, string, null, list or a map with string keys). The function must
 * return an object that is directly encodable. The elements of a returned list
 * and values of a returned map do not need to be directly encodable, and if
 * they aren't, toEncodable will be used on them as well. Please notice that it
 * is possible to cause an infinite recursive regress in this way, by
 * effectively creating an infinite data structure through repeated call to
 * toEncodable.
 * @description Checks that this constructor, called with toEncodable parameter,
 * creates object with toEncodable function which is used during encoding
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

checkEncodable(JsonCodec codec, var object, var expected) {
  String encoded = codec.encode(object);
  Expect.equals(expected, encoded);
}

main() {
  JsonCodec codec = new JsonCodec(toEncodable: toEncodable);

  checkEncodable(codec, 1, "1");
  checkEncodable(codec, 3.14, "3.14");
  checkEncodable(codec, null, "null");
  checkEncodable(codec, "str", '"str"');
  checkEncodable(codec, true, 'true');
  checkEncodable(codec, false, 'false');
  checkEncodable(codec, [1, 2, 3], "[1,2,3]");
  checkEncodable(codec, {"a": "b"}, '{"a":"b"}');
  checkEncodable(codec, new A(), '"A encoded by toEncodable"');
  checkEncodable(codec, new C(), '"C encoded by toEncodable"');
  checkEncodable(codec, [new C(), new A()],
      '["C encoded by toEncodable","A encoded by toEncodable"]');
  // Map with not a string keys
  checkEncodable(codec, {new C(): new A()}, '"Another encoded by toEncodable"');

  // Map with a string keys
  checkEncodable(codec, {"x": new A()}, '{"x":"A encoded by toEncodable"}');
}
