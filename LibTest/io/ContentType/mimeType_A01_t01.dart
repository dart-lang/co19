/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion String mimeType
 * Gets the mime-type, without any parameters.
 * @description Checks that this property returns the mime-type, without any
 * parameters
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";

main() {
  ContentType contentType = new ContentType("text", "html", charset: "utf-8");
  Expect.equals("text/html", contentType.mimeType);

  contentType = new ContentType("text", "html",
      parameters: {"charset": "utf-8"});
  Expect.equals("text/html", contentType.mimeType);
  Expect.mapEquals({"charset": "utf-8"}, contentType.parameters);

  contentType = new ContentType("text", "html", charset: "cp1251",
      parameters: {"p1": "v1"});
  Expect.equals("text/html", contentType.mimeType);

  contentType = new ContentType("Text", "Html");
  Expect.equals("Text/Html", contentType.mimeType);

  contentType = new ContentType("", "");
  Expect.equals("/", contentType.mimeType);
}
