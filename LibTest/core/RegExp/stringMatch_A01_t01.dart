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
 */
import "../../../Utils/expect.dart";
 
main() {
  check("(ab|cd)+|ef", "AEKFCD", false, false, "CD");
  check(".+: gr(a|e)y", "color: grey", false, true, "color: grey");
  check("((a)|(ab))((c)|(bc))", "abc", false, true, "abc");
  check(r"^(a+)\1*,\1+$", "aaaaaaaaa,aaaaaa", false, true, "aaaaaaaaa,aaaaaa");
  check(r"^(a+?)\1*,\1+$", "aaaaaa,aaaaaaaaa", false, true, "aaaaaa,aaaaaaaaa");
  check("(z)((a+)?(b+)?(c))*", "zaacbbbcac", false, true, "zaacbbbcac");
  check(r"s$", "pairs\nmakes\tdouble", true, true, "s");
  check(r"[^e]$", "pairs\nmakes\tdouble", true, true, "s");
  check(r"[^o]t\b", "pilOt\nsoviet robot\topenoffice", false, true, "Ot");
  check(r"[^o]t\b", "pilOt\nsoviet robot\topenoffice", false, false, "et");
  check(r"^^^^^^^\b\b\b\bro\B\B\B\Bbot\b\b\b\b\b$$$$", "robot", false, true,
      "robot");
  check(r"(?=(a+))", "baaabac", false, true, "");
  check(r"(?!a|b)|c", "bc", false, true, "");
}

void check(String pattern, String str, bool multiLine, bool caseSensitive,
    String expectedMatch) {
  RegExp re = new RegExp(pattern, multiLine: multiLine,
      caseSensitive: caseSensitive);
  Expect.equals(expectedMatch, re.stringMatch(str));
}
