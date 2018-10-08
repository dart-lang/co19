/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion const HtmlEscapeMode({
 *  String name: "custom",
 *  bool escapeLtGt: false,
 *  bool escapeQuot: false,
 *  bool escapeApos: false,
 *  bool escapeSlash: false
 *  })
 *  Create a custom escaping mode.
 *
 * All modes escape &. The mode can further be set to escape < and >
 * (escapeLtGt), " (escapeQuot), ' (escapeApos), and/or / (escapeSlash).
 * @description Checks that this constructor creates a custom escaping mode.
 * Test escapeApos true
 * @author sgrekhov@unipro.ru
 */
import "dart:convert";
import "../../../Utils/expect.dart";

var symbols = ["&", "'"];
var escape = ["&amp;", "&#39;"];
var notEscaped = ["\"", "<", ">", "/"];

main() {
  HtmlEscapeMode htmlEscapeMode = new HtmlEscapeMode(escapeApos: true);
  HtmlEscape converter = new HtmlEscape(htmlEscapeMode);
  for (int i = 0; i < symbols.length; i++) {
    Expect.equals(escape[i], converter.convert(symbols[i]));
  }
  for (int i = 0; i < notEscaped.length; i++) {
    Expect.equals(notEscaped[i], converter.convert(notEscaped[i]));
  }
  Expect.equals(htmlEscapeMode, converter.mode);
  Expect.isTrue(htmlEscapeMode.escapeApos);
  Expect.isFalse(htmlEscapeMode.escapeLtGt);
  Expect.isFalse(htmlEscapeMode.escapeQuot);
  Expect.isFalse(htmlEscapeMode.escapeSlash);
}
