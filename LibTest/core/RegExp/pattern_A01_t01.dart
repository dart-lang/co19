/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final String pattern
 * The pattern of this regular expression. 
 * @description Checks that this property holds the correct string.
 * @author rodionov
 */
import "../../../Utils/expect.dart";
 
main() {
  check("(ab|cd)+|ef", "AEKFCD", false, false);
  check(".+: gr(a|e)y", "color: grey", false, true);
  check("((a)|(ab))((c)|(bc))", "abc", false, true);
  check(r"^(a+)\1*,\1+$", "aaaaaaaaa,aaaaaa", false, true);
  check(r"^(a+?)\1*,\1+$", "aaaaaa,aaaaaaaaa", false, true);
  check("(z)((a+)?(b+)?(c))*", "zaacbbbcac", false, true);
  check(r"[^o]t\b", "pilOt\nsoviet robot\topenoffice", false, true);
  check(r"[^o]t\b", "pilOt\nsoviet robot\topenoffice", false, false);
  check(r"^^^^^^^\b\b\b\bro\B\B\B\Bbot\b\b\b\b\b$$$$", "robot", false, true);
}

void check(String pattern, String str, bool multiLine, bool caseSensitive) {
  RegExp re = new RegExp(pattern, multiLine: multiLine,
      caseSensitive: caseSensitive);
  Expect.stringEquals(pattern, re.pattern);
}
