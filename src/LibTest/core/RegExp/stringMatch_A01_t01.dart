/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Searches for the first match of the regular expression in the
 *            string [str] and returns the matched string.
 * @description Checks that the correct string is returned.
 * @author rodionov
 * @reviewer msyabro
 */
 
main() {
  check("(ab|cd)+|ef", "AEKFCD", false, true, "CD");
  check(".+: gr(a|e)y", "color: grey", false, false, "color: grey");
  check("((a)|(ab))((c)|(bc))", "abc", false, false, "abc");
  check(r"^(a+)\1*,\1+$", "aaaaaaaaa,aaaaaa", false, false, "aaaaaaaaa,aaaaaa");
  check(r"^(a+?)\1*,\1+$", "aaaaaa,aaaaaaaaa", false, false, "aaaaaa,aaaaaaaaa");
  check("(z)((a+)?(b+)?(c))*", "zaacbbbcac", false, false, "zaacbbbcac");
  check(r"s$", "pairs\nmakes\tdouble", true, false, "s");
  check(r"[^e]$", "pairs\nmakes\tdouble", true, false, "s");
  check(r"[^o]t\b", "pilOt\nsoviet robot\topenoffice", false, false, "Ot");
  check(r"[^o]t\b", "pilOt\nsoviet robot\topenoffice", false, true, "et");
  check(r"^^^^^^^\b\b\b\bro\B\B\B\Bbot\b\b\b\b\b$$$$", "robot", false, false, "robot");
  check(r"(?=(a+))", "baaabac", false, false, "");
  check(r"(?!a|b)|c", "bc", false, false, "");
}

void check(String pattern, String str, bool multiLine, bool ignoreCase, String expectedMatch) {
  RegExp re = new RegExp(pattern, multiLine: multiLine, ignoreCase: ignoreCase);
  Expect.equals(expectedMatch, re.stringMatch(str));
}
