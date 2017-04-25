/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion String subType
 *  Gets the sub type.
 * @description Checks that this property returns the sub type.
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";

main() {
  ContentType contentType = new ContentType("text", "html", charset: "utf-8");
  Expect.equals("html", contentType.subType);

  contentType = new ContentType("text", "");
  Expect.equals("", contentType.subType);

  contentType = new ContentType("teXt", "htMl");
  Expect.equals("htMl", contentType.subType);
}
