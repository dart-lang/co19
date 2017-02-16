/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Object encode(Object value, {toEncodable(object)})
 * Converts value to a JSON string.
 * ...
 * If toEncodable is omitted, it defaults to calling .toJson() on the
 * unencodable object.
 * @description Checks that if toEncodable is omitted, and unencodable object
 * has no .toJson() method then an error occurs
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";
import "dart:convert";

class C {
}

main() {
  JsonCodec codec = new JsonCodec();
  Expect.throws(() {codec.encode(new C());});
}
