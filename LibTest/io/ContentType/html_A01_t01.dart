/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion dynamic HTML
 *  final
 *  Content type for HTML using UTF-8 encoding.
 * @description Checks that this constant returns content type for HTML using
 * UTF-8 encoding
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";

main() {
  Expect.isNotNull(ContentType.html);
  Expect.equals("text/html; charset=utf-8", ContentType.html.toString());
}
