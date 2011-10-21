/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Returns the string matched by the given [group]. If [group] is 0,
 *            returns the match of the regular expression.
 * @description Checks that correct group is returned.
 * @author rodionov
 * @reviewer msyabro
 */

void check(String str, String pattern, String expected, [bool multiLine = false, bool ignoreCase = false]) {
  RegExp re = new RegExp(pattern, multiLine, ignoreCase);
  Match m = re.firstMatch(str);
  Expect.equals(expected.length, m.groupCount() + 1);
  for(int i = 0; i < expected.length; i++) {
    Expect.equals(expected[i],m.group(i));
  }
}

main() {
  check("ABCDEF", "(([A-Z])*)", ["ABCDEF", "ABCDEF", "F"]);
  check("a", @"((((((((a))))))))", ["a","a","a","a","a","a","a","a","a"]);
  check("AEKFCD", @"(ab|cd)+|ef", ["CD", "CD"], ignoreCase: true);
  check("abc", @"((a)|(ab))((c)|(bc))", ["abc", "a", "a", "", "bc", "", "bc"]);
  check("aa", @"(a)(\1)", ["aa", "a", "a"]);
  check("a", @"[a-z]", ["a"]);
}
