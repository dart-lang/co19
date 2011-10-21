/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Returns the string matched by the given [group]. If [group] is 0,
 *            returns the match of the regular expression.
 * @description Checks that the correct group is returned when valid index is used.
 * @author rodionov
 * @reviewer msyabro
 */
 
main() {
  check("(ab|cd)+|ef", "AEKFCD", ["CD", "CD"], ignoreCase: true);
  check(".+: gr(a|e)y", "color: grey", ["color: grey", "e"]);
  check("((a)|(ab))((c)|(bc))", "abc", ["abc", "a", "a", "", "bc", "", "bc"]);
  check(@"^(a+)\1*,\1+$", "aaaaaaaaa,aaaaaa", ["aaaaaaaaa,aaaaaa", "aaa"]);
  check(@"^(a+?)\1*,\1+$", "aaaaaa,aaaaaaaaa", ["aaaaaa,aaaaaaaaa", "a"]);
  check("(z)((a+)?(b+)?(c))*", "zaacbbbcac", ["zaacbbbcac", "z", "ac", "a", "", "c"]);
  check(@"[^o]t\b", "pilOt\nsoviet robot\topenoffice", ["Ot"]);
  check(@"[^o]t\b", "pilOt\nsoviet robot\topenoffice", ["et"], ignoreCase: true);
  check(@"^^^^^^^\b\b\b\bro\B\B\B\Bbot\b\b\b\b\b$$$$", "robot", ["robot"]);
}

void check(String pattern, String str, List<String> groupData, [bool multiLine = false, bool ignoreCase = false]) {
  RegExp re = new RegExp(pattern, multiLine, ignoreCase);
  Match fm = re.firstMatch(str);
  if(null == fm) {
    Expect.fail("\"$pattern\" !~ \"$str\"");
  }

  Expect.equals(groupData.length, fm.groupCount() + 1);
  
  for(int i = 0; i <= fm.groupCount(); i++) {
    String actGr = fm[i];
    String expGr = groupData[i];
    if(expGr != actGr) {
      Expect.fail("Mismatch at group $i: '$expGr' expected instead of '$actGr'");
    }
  }
}
