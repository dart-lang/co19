/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Returns [null] if there is no match.
 * @description Checks that null is returned when appropriate.
 * @author rodionov
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
  Expect.equals(null, re.firstMatch(str));
}
