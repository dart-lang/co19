// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion JsonUtf8Encoder([
///  String indent,
///  dynamic toEncodable(
///  object
///  ),
///  int bufferSize = DEFAULT_BUFFER_SIZE
///  ])
/// Create converter.
///
/// If indent is non-null, the converter attempts to "pretty-print" the JSON,
/// and uses indent as the indentation. Otherwise the result has no whitespace
/// outside of string literals. If indent contains characters that are not valid
/// JSON whitespace characters, the result will not be valid JSON. JSON
/// whitespace characters are space (U+0020), tab (U+0009), line feed (U+000a)
/// and carriage return (U+000d) (ECMA 404).
///
/// The bufferSize is the size of the internal buffers used to collect UTF-8 code
/// units. If using startChunkedConversion, it will be the size of the chunks.
///
/// The JSON encoder handles numbers, strings, booleans, null, lists and maps
/// directly.
///
/// Any other object is attempted converted by toEncodable to an object that is
/// of one of the convertible types.
///
/// If toEncodable is omitted, it defaults to calling .toJson() on the object.
/// @description Checks that this constructor, called with indent parameter,
/// creates object with default appropriate indent
/// @author sgrekhov@unipro.ru

import "dart:convert";
import "../../../Utils/expect.dart";

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
  JsonUtf8Encoder encoder = new JsonUtf8Encoder(null);

  check(encoder, 1, "1");
  check(encoder, 3.14, "3.14");
  check(encoder, null, "null");
  check(encoder, "str", '"str"');
  check(encoder, true, 'true');
  check(encoder, false, 'false');
  check(encoder, [1, 2, 3], "[1,2,3]");
  check(encoder, {"a": "b"}, '{"a":"b"}');
  check(encoder, new A(), new A().toJson());
  check(encoder, new C(), '"' + new C().toJson() + '"');

  encoder = new JsonUtf8Encoder(" ");

  check(encoder, 1, "1");
  check(encoder, 3.14, "3.14");
  check(encoder, null, "null");
  check(encoder, "str", '"str"');
  check(encoder, true, 'true');
  check(encoder, false, 'false');
  check(encoder, [1, 2, 3], "[\n 1,\n 2,\n 3\n]");
  check(encoder, {"a": "b"}, '{\n "a": "b"\n}');
  check(encoder, new A(), new A().toJson());
  check(encoder, new C(), '"' + new C().toJson() + '"');

  encoder = new JsonUtf8Encoder(" й ");

  check(encoder, 1, "1");
  check(encoder, 3.14, "3.14");
  check(encoder, null, "null");
  check(encoder, "str", '"str"');
  check(encoder, true, 'true');
  check(encoder, false, 'false');
  check(encoder, [1, 2, 3], "[\n й 1,\n й 2,\n й 3\n]");
  check(encoder, {"a": "b"}, '{\n й "a": "b"\n}');
  check(encoder, new A(), new A().toJson());
  check(encoder, new C(), '"' + new C().toJson() + '"');
}
