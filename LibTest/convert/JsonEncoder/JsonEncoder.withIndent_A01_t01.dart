// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion const JsonEncoder.withIndent(
///   String indent, [dynamic toEncodable(nonSerializable)])
/// Creates a JSON encoder that creates multi-line JSON.
/// The encoding of elements of lists and maps are indented and put on separate
/// lines. The indent string is prepended to these elements, once for each level
/// of indentation.
///
/// If indent is null, the output is encoded as a single line.
///
/// The JSON encoder handles numbers, strings, booleans, null, lists and maps
/// directly.
///
/// Any other object is attempted converted by toEncodable to an object that is
/// of one of the convertible types.
///
/// If toEncodable is omitted, it defaults to calling .toJson() on the object.
///
/// @description Checks that this constructor, called with null indent parameter,
/// and no toEncodable creates object with default toEncodable
/// @author sgrekhov@unipro.ru

import "dart:convert";
import "../../../Utils/expect.dart";

class A {
  Object toJson() => 42;
}

class C {
  String toJson() => "C: this is JSON";
}

check(JsonEncoder encoder, var object, var expected) {
  var encoded = encoder.convert(object);
  Expect.equals(expected.toString(), encoded.toString());
}

main() {
  JsonEncoder encoder = new JsonEncoder.withIndent(null);

  check(encoder, new A(), new A().toJson());
  check(encoder, new C(), '"' + new C().toJson() + '"');
  check(encoder, 1, "1");
  check(encoder, 3.14, "3.14");
  check(encoder, null, "null");
  check(encoder, "str", '"str"');
  check(encoder, true, 'true');
  check(encoder, false, 'false');
  check(encoder, [1, 2, 3], "[1,2,3]");
  check(encoder, {"a": "b"}, '{"a":"b"}');
}
