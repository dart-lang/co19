/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion T convert(S input)
 * Converts input and returns the result of the conversion.
 * @description Checks that this method converts input and returns the result
 * of the conversion.
 * @author sgrekhov@unipro.ru
 */
import "dart:convert";
import "../../../Utils/expect.dart";

var symbols = ["\"", "&", "<", ">", "'", "/"];
var escape = ["&quot;", "&amp;", "&lt;", "&gt;", "&#39;", "&#47;"];

check(HtmlEscape converter) {
  for (int i = 0; i < symbols.length; i++) {
    Expect.equals(escape[i], converter.convert(symbols[i]));
  }
}

main() {
  check(new HtmlEscape());
  check(new HtmlEscape(HtmlEscapeMode.unknown));
}
