/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion String charset
 * Gets the character set.
 * @description Checks that this property returns the character set
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";

main() {
  ContentType contentType = new ContentType("text", "html");
  Expect.isNull(contentType.charset);

  contentType = new ContentType("text", "html", charset: "utf-8");
  Expect.equals("utf-8", contentType.charset);
  Expect.mapEquals({"charset": "utf-8"}, contentType.parameters);

  contentType = new ContentType("text", "html",
      parameters: {"charset": "utf-8"});
  Expect.equals("utf-8", contentType.charset);
  Expect.mapEquals({"charset": "utf-8"}, contentType.parameters);
}
