/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool escapeQuot
 *  read-only
 * Whether to escape '"' (quote).
 * @description Checks that this property shows if quote is escaped
 * Test default constructor values
 * @author sgrekhov@unipro.ru
 */
import "dart:convert";
import "../../../Utils/expect.dart";

main() {
  HtmlEscapeMode htmlEscapeMode = new HtmlEscapeMode();
  Expect.isFalse(htmlEscapeMode.escapeQuot);

  htmlEscapeMode = new HtmlEscapeMode(escapeQuot: true);
  Expect.isTrue(htmlEscapeMode.escapeQuot);
}
