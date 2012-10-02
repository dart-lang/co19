/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final Pattern pattern
 * The pattern to search for in [str]. 
 * @description Checks that this property holds the correct pattern.
 * @author rodionov
 * @reviewer msyabro
 * @note issue 1301
 */

main() {
  check(r"^[^\n\r]+$", "pilOt\nsoviet\trobot\r\nopenoffice", true, false);
  check(r"^(a+)\1*,\1+$", "aaaaaaaaa,aaaaaa\naa,aaaa\naaaaa,a", true, false);
  check(r"(ab|cd)+|ef", "AEKFCD", false, true);
}
  
void check(String pattern, String str, bool multiLine, bool ignoreCase) {
  RegExp re = new RegExp(pattern, multiLine: multiLine, ignoreCase: ignoreCase);
  Collection<Match> matches = re.allMatches(str);
  if(0 == matches.length) {
    Expect.fail("\"$pattern\" !~ \"$str\"");
  }

  matches.forEach(void f(Match match) {
    Expect.equals(pattern, match.pattern);
  });
}
