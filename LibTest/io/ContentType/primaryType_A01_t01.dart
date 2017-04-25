/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion String primaryType
 * Gets the primary type.
 * @description Checks that this property returns the primary type.
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";

main() {
  ContentType contentType = new ContentType("text", "html", charset: "utf-8");
  Expect.equals("text", contentType.primaryType);

  contentType = new ContentType("", "html");
  Expect.equals("", contentType.primaryType);

  contentType = new ContentType("teXt", "html");
  Expect.equals("teXt", contentType.primaryType);
}
