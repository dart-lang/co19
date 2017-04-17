/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion HtmlEscapeMode mode
 * The HtmlEscapeMode used by the converter.
 * @description Checks that this property returns HtmlEscapeMode used by the
 * converter
 * @author sgrekhov@unipro.ru
 */
import "dart:convert";
import "../../../Utils/expect.dart";

main() {
  HtmlEscape converter = new HtmlEscape();
  Expect.equals(HtmlEscapeMode.UNKNOWN, converter.mode);

  converter = new HtmlEscape(HtmlEscapeMode.ELEMENT);
  Expect.equals(HtmlEscapeMode.ELEMENT, converter.mode);

  converter = new HtmlEscape(HtmlEscapeMode.ATTRIBUTE);
  Expect.equals(HtmlEscapeMode.ATTRIBUTE, converter.mode);

  converter = new HtmlEscape(HtmlEscapeMode.SQ_ATTRIBUTE);
  Expect.equals(HtmlEscapeMode.SQ_ATTRIBUTE, converter.mode);
}
