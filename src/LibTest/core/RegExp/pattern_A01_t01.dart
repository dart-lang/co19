/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final String pattern
 * The pattern of this regular expression. 
 * @description Checks that this property holds the correct string.
 * @reviewer pagolubev
 * @author rodionov
 */
 
main() {
  check("(ab|cd)+|ef", "AEKFCD", false, true);
  check(".+: gr(a|e)y", "color: grey", false, false);
  check("((a)|(ab))((c)|(bc))", "abc", false, false);
  check(@"^(a+)\1*,\1+$", "aaaaaaaaa,aaaaaa", false, false);
  check(@"^(a+?)\1*,\1+$", "aaaaaa,aaaaaaaaa", false, false);
  check("(z)((a+)?(b+)?(c))*", "zaacbbbcac", false, false);
  check(@"[^o]t\b", "pilOt\nsoviet robot\topenoffice", false, false);
  check(@"[^o]t\b", "pilOt\nsoviet robot\topenoffice", false, true);
  check(@"^^^^^^^\b\b\b\bro\B\B\B\Bbot\b\b\b\b\b$$$$", "robot", false, false);
}

void check(String pattern, String str, bool multiLine, bool ignoreCase) {
  RegExp re = new RegExp(pattern, multiLine: multiLine, ignoreCase: ignoreCase);
  Expect.stringEquals(pattern, re.pattern);
}
