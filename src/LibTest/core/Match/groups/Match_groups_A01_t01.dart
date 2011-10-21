/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Returns the strings matched by [groups]. The order in the returned
 *            string follows the order in [groups].
 * @description Checks that the correct groups are returned and their order is
 *              correct (including the cases of both repeating and missing
 *              indices as well as matches other than the first one).
 * @author rodionov
 * @reviewer msyabro
 */
 
main() {
  check(".+: gr(a|e)y", "color: grey", 0, [0, 1], ["color: grey", "e"]);
  check(".+: gr(a|e)y", "color: grey", 0, [1, 0], ["e", "color: grey"]);
  check(".+: gr(a|e)y", "color: grey", 0, [0, 0, 0], ["color: grey", "color: grey", "color: grey"]);
  check(".+: gr(a|e)y", "color: grey", 0, [1, 1], ["e", "e"]);
  
  check("((a)|(ab))((c)|(bc))", "abc", 0, [0, 1, 2, 3, 4, 5, 6], ["abc", "a", "a", "", "bc", "", "bc"]);
  check("((a)|(ab))((c)|(bc))", "abc", 0, [0], ["abc"]);
  check("((a)|(ab))((c)|(bc))", "abc", 0, [1, 1], ["a", "a"]);
  check("((a)|(ab))((c)|(bc))", "abc", 0, [3, 3, 3, 0, 4, 4, 4], ["", "", "", "abc", "bc", "bc", "bc"]);
  check("((a)|(ab))((c)|(bc))", "abc", 0, [6, 4, 2, 1, 3, 5, 0], ["bc", "bc", "a", "a", "", "", "abc"]);
  check("((a)|(ab))((c)|(bc))", "abc", 0, [6, 6, 6, 6, 6, 6, 6, 6], ["bc", "bc", "bc", "bc", "bc", "bc", "bc", "bc"]);
  check("((a)|(ab))((c)|(bc))", "abc", 0,
      [6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6], 
      ["bc", "bc", "bc", "bc", "bc", "bc", "bc", "bc", "bc", "bc", "bc", "bc", "bc", "bc", "bc"]);

  check(@"^(a+)\1*,(\1+)$", "aaaaaaaaa,aaaaaa\naa,aaaa\naaaaa,a", 1, [0, 1, 2], ["aa,aaaa", "aa", "aaaa"],
       multiLine: true);
  check(@"^(a+)\1*,(\1+)$", "aaaaaaaaa,aaaaaa\naa,aaaa\naaaaa,a", 1, [1], ["aa"], multiLine: true);
  check(@"^(a+)\1*,(\1+)$", "aaaaaaaaa,aaaaaa\naa,aaaa\naaaaa,a", 1,
      [2, 1, 2, 0, 2, 2], ["aaaa", "aa", "aaaa", "aa,aaaa", "aaaa", "aaaa"], multiLine: true);
}

void check(String pattern, String str, int matchNum, List<int> groupIndices, List<String> expGroups,
    [bool multiLine = false, bool ignoreCase = false]) {
  RegExp re = new RegExp(pattern, multiLine, ignoreCase);
  Match match = new List.from(re.allMatches(str))[matchNum];
  if(null == match) {
    Expect.fail("No match #$matchNum in '$pattern'/ ~ '$str'!");
  }
  // make sure the test parameters are correct
  Expect.equals(expGroups.length, groupIndices.length);

  List<String> groups = match.groups(groupIndices);
  Expect.equals(groupIndices.length, groups.length);
  
  for(int i = 0; i < expGroups.length; i++) {
    if(expGroups[i] != groups[i]) {
      Expect.fail("Result of Match.groups() incorrect: $expGroups != $groups");
    }
  }
}
