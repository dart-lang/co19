/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final String str
 * The string on which this matcher was computed. 
 * @description Checks that this property holds the correct string.
 * @author rodionov
 * @reviewer msyabro
 */

main() {
  check(@"^[^\n\r]+$", "pilOt\nsoviet\trobot\r\nopenoffice", true, false);
  check(@"^(a+)\1*,\1+$", "aaaaaaaaa,aaaaaa\naa,aaaa\naaaaa,a", true, false);
  check(@"(ab|cd)+|ef", "AEKFCD", false, true);
}
  
void check(String pattern, String str, bool multiLine, bool ignoreCase) {
  RegExp re = new RegExp(pattern, multiLine: multiLine, ignoreCase: ignoreCase);
  Collection<Match> matches = re.allMatches(str);
  if(0 == matches.length) {
    Expect.fail("\"$pattern\" !~ \"$str\"");
  }

  matches.forEach(void f(Match match) {
    Expect.stringEquals(str, match.str);
  });
}
