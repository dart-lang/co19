/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Returns [null] if there is no match.
 * @description Checks that null is returned when appropriate.
 * @author rodionov
 * @reviewer msyabro
 */
 
main() {
  check(@"\d+", "asfjkasfjkhasfj");
  check(@"^m", "pairs\nmakes\tdouble");
  check(@"s$", "pairs\nmakes\tdouble");
  check(@"^p[b-z]", "pairs\nmakes\tdouble\npesos");
  check(@"^..^e", "ab\ncde");
  check(@"\bot", "pilot\nsoviet robot\topenoffice");
}

void check(String pattern, String str) {
  RegExp re = new RegExp(pattern, false, false);
  Expect.equals(null, re.firstMatch(str));
}
