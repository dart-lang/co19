/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Map<String, String> parameters
 * Gets the map of parameters.
 *
 * This map cannot be modified. Invoking any operation which would modify the
 * map will throw UnsupportedError.
 * @description Checks that this property returns the map of parameters.
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";

main() {
  ContentType contentType = new ContentType("text", "html");
  Expect.mapEquals({}, contentType.parameters);

  contentType = new ContentType("text", "html", parameters: {"a": "b"});
  Expect.mapEquals({"a": "b"}, contentType.parameters);

  contentType = new ContentType("text", "html", charset: "utf-8",
      parameters: {"a": "b"});
  Expect.mapEquals({"a": "b", "charset": "utf-8"}, contentType.parameters);

  contentType = new ContentType("text", "html", charset: "utf-8",
      parameters: {"a": "b", "charset": "cp1251"});
  Expect.mapEquals({"a": "b", "charset": "utf-8"}, contentType.parameters);
}
