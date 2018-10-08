/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * ...
 * Whitespace is defined by the Unicode White_Space property (as defined in
 * version 6.2 or later) and the BOM character, 0xFEFF.
 * @description Checks that all possible whitespaces are trimmed
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

main() {
  List<String> whitespaces = [
    "\u{0009}", "\u{000A}", "\u{000B}", "\u{000C}", "\u{000D}", "\u{0020}",
    "\u{0085}", "\u{00A0}", "\u{1680}", "\u{2000}", "\u{2001}", "\u{2002}",
    "\u{2003}", "\u{2004}", "\u{2005}", "\u{2006}", "\u{2007}", "\u{2008}",
    "\u{2009}", "\u{200A}", "\u{2028}", "\u{2029}", "\u{202F}", "\u{205F}",
    "\u{3000}", "\u{FEFF}"];

  whitespaces.forEach((whitespace) {
    String s = whitespace + "string" + whitespace;
    Expect.equals("string", s.trim(), "String.trim() doesn't work for " +
        "character " + whitespace.codeUnitAt(0).toString());
  });
}
