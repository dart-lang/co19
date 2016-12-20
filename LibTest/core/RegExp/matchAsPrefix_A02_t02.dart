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
 * @description Checks that null is returned when appropriate. Test not null
 * start argument
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";
 
main() {
  check(r"\d+", "adasfjkasfjkhasfj", 2);
  check(r"^m", "mpairs\nmakes\tdouble", 1);
  check(r"s$", "spairs\nmakes\tdouble", 1);
  check(r"^p[b-z]", "1pairs\nmakes\tdouble\npesos", 1);
  check(r"^..^e", "eeab\ncde", 2);
  check(r"\bot", "botpilot\nsoviet robot\topenoffice", 3);
}

void check(String pattern, String str, int start) {
  RegExp re = new RegExp(pattern);
  Expect.equals(null, re.matchAsPrefix(str, start));
}
