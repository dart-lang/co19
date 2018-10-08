/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion const HtmlEscape([HtmlEscapeMode mode = HtmlEscapeMode.unknown])
 * Create converter that escapes HTML characters.
 *
 * If mode is provided as either HtmlEscapeMode.attribute or
 * HtmlEscapeMode.element, only the corresponding subset of HTML characters are
 * escaped. The default is to escape all HTML characters.
 * @description Checks that this constructor creates converter that escapes
 * HTML characters. Test HtmlEscapeMode.sqAttribute  mode
 * @author sgrekhov@unipro.ru
 */
import "dart:convert";
import "../../../Utils/expect.dart";

var symbols = ["<", ">", "&", "'"];
var escape = ["&lt;", "&gt;", "&amp;", "&#39;"];
var notEscaped = ["\"", "/"];

main() {
  HtmlEscape converter = new HtmlEscape(HtmlEscapeMode.sqAttribute);
  for (int i = 0; i < symbols.length; i++) {
    Expect.equals(escape[i], converter.convert(symbols[i]));
  }
  for (int i = 0; i < notEscaped.length; i++) {
    Expect.equals(notEscaped[i], converter.convert(notEscaped[i]));
  }
}
