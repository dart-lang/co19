/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertionconst JsonEncoder.withIndent(
 *  String indent, [
 *  dynamic toEncodable(
 *  nonSerializable
 *  )
 *  ])
 * Creates a JSON encoder that creates multi-line JSON.
 * The encoding of elements of lists and maps are indented and put on separate
 * lines. The indent string is prepended to these elements, once for each level
 * of indentation.
 *
 * If indent is null, the output is encoded as a single line.
 *
 * The JSON encoder handles numbers, strings, booleans, null, lists and maps
 * directly.
 *
 * Any other object is attempted converted by toEncodable to an object that is
 * of one of the convertible types.
 *
 * If toEncodable is omitted, it defaults to calling .toJson() on the object.
 * @description Checks that this constructor, called with not null indent
 * parameter and toEncodable creates a JSON encoder that creates multi-line
 * JSON.
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
  JsonEncoder encoder = new JsonEncoder.withIndent("--", toEncodable);

  check(encoder, new A(), '"A encoded by toEncodable"');
  check(encoder, new C(), '"C encoded by toEncodable"');
  check(encoder, 1, "1");
  check(encoder, 3.14, "3.14");
  check(encoder, null, "null");
  check(encoder, "str", '"str"');
  check(encoder, true, 'true');
  check(encoder, false, 'false');
  check(encoder, [1, 2, 3], "[\n--1,\n--2,\n--3\n]");
  check(encoder, {"a": "b"}, '{\n--"a": "b"\n}');
}
