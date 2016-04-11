/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Dart source text is represented as a sequence of Unicode code
 * points.
 * @description Checks that common punctuation and arithmetic symbols are
 * represented as a sequence of Unicode code points.
 * @author vasya
 * @reviewer rodionov
 */
import "../../../Utils/expect.dart";

main() {
  List unicode = ["\u0020", "\u0021", "\u0022", "\u0023", "\u0024", "\u0025",
                  "\u0026", "\u0027", "\u0028", "\u0029", "\u002A", "\u002B",
                  "\u002C", "\u002D", "\u002E", "\u002F", "\u003A", "\u003B",
                  "\u003C", "\u003D", "\u003E", "\u003F", "\u0040", "\u005B",
                  "\u005C", "\u005D", "\u005E", "\u005F", "\u007B", "\u007C",
                  "\u007D", "\u007E"];
  List character = [r" ", r"!", r'"', r"#", r"$", r"%", r"&", r"'",
                    r"(", r")", r"*", r"+", r",", r"-", r".", r"/",
                    r":", r";", r"<", r"=", r">", r"?", r"@", r"[",
                    r"\", r"]", r"^", r"_", r"{", r"|", r"}", r"~"];

  Expect.listEquals(unicode, character);
}
