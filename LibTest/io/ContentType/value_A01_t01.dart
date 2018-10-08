/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion String value
 * Gets the header value.
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
  Expect.equals("text/html", contentType.value);

  contentType = new ContentType("text", "html", parameters: {"a": "b"});
  Expect.equals("text/html", contentType.value);

  contentType = new ContentType("text", "html", charset: "utf-8",
      parameters: {"a": "b"});
  Expect.equals("text/html", contentType.value);

  contentType = new ContentType("text", "html", charset: "utf-8",
      parameters: {"a": "b", "charset": "cp1251"});
  Expect.equals("text/html", contentType.value);
}
