/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool escapeSlash
 *  read-only
 * Whether to escape "/" (forward slash, solidus).
 * @description Checks that this property shows if slash is escaped
 * Test default constructor values
 * @author sgrekhov@unipro.ru
 */
import "dart:convert";
import "../../../Utils/expect.dart";

main() {
  HtmlEscapeMode htmlEscapeMode = new HtmlEscapeMode();
  Expect.isFalse(htmlEscapeMode.escapeSlash);

  htmlEscapeMode = new HtmlEscapeMode(escapeSlash: true);
  Expect.isTrue(htmlEscapeMode.escapeSlash);
}
