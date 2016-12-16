/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Searches for the first match of the regular expression in the
 *            string [str].
 * @description Checks that the returned Match is correctly initialized.
 * @author rodionov
 * @note Issue 1290
 */
import "../../../Utils/expect.dart";
 
main() {
  check("(ab|cd)+|ef", "AEKFCD", false, true, [4, 6, "CD", "CD"]);
  check(".+: gr(a|e)y", "color: grey", false, false,
        [0, 11, "color: grey", "e"]);
  check("((a)|(ab))((c)|(bc))", "abc", false, false,
        [0, 3, "abc", "a", "a", null, "bc", null, "bc"]);
  check(r"^(a+)\1*,\1+$", "aaaaaaaaa,aaaaaa", false, false,
        [0, 16, "aaaaaaaaa,aaaaaa", "aaa"]);
  check(r"^(a+?)\1*,\1+$", "aaaaaa,aaaaaaaaa", false, false,
        [0, 16, "aaaaaa,aaaaaaaaa", "a"]);
  
  // Issue 1290
  check("(z)((a+)?(b+)?(c))*", "zaacbbbcac", false, false,
        [0, 10, "zaacbbbcac", "z", "ac", "a", null, "c"]);
  
  check(r"[^o]t\b", "pilOt\nsoviet robot\topenoffice", false, false,
        [3, 5, "Ot"]);
  check(r"[^o]t\b", "pilOt\nsoviet robot\topenoffice", false, true,
        [10, 12, "et"]);
  check(r"^^^^^^^\b\b\b\bro\B\B\B\Bbot\b\b\b\b\b$$$$", "robot", false, false,
        [0, 5, "robot"]);
}

void check(String pattern, String str, bool multiLine, bool ignoreCase,
    List groupData) {
  RegExp re = new RegExp(
      pattern, multiLine: multiLine, caseSensitive: !ignoreCase);
  Match fm = re.firstMatch(str);
  if(null == fm) {
    Expect.fail("\"$pattern\" !~ \"$str\"");
  }
  Expect.equals(str, fm.input);
  Expect.equals(pattern, (fm.pattern as RegExp).pattern);
  if(null != groupData) {
    Expect.equals(groupData.length, fm.groupCount + 3);
    Expect.equals(groupData[0], fm.start);
    Expect.equals(groupData[1], fm.end);
    
    for(int i = 0; i <= fm.groupCount; i++) {
      String actGr = fm.group(i);
      String expGr = groupData[i + 2];
      if(expGr != actGr) {
        Expect.fail(
            "Mismatch at group $i: '$expGr' expected instead of '$actGr'");
      }
    }
  }
}
