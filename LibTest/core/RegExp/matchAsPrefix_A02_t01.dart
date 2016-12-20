/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Match matchAsPrefix(String string, [int start = 0])
 * Match this pattern against the start of string.
 * ...
 * Returns null if the pattern doesn't match.
 * @description Checks that null is returned when appropriate.
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";
 
main() {
  check(r"\d+", "asfjkasfjkhasfj");
  check(r"^m", "pairs\nmakes\tdouble");
  check(r"s$", "pairs\nmakes\tdouble");
  check(r"^p[b-z]", "pairs\nmakes\tdouble\npesos");
  check(r"^..^e", "ab\ncde");
  check(r"\bot", "pilot\nsoviet robot\topenoffice");
}

void check(String pattern, String str) {
  RegExp re = new RegExp(pattern);
  Expect.equals(null, re.matchAsPrefix(str));
}
