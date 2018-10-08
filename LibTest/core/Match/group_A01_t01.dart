/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Returns the string matched by the given [group]. If [group] is 0,
 * returns the match of the regular expression.
 * @description Checks that correct group is returned.
 * @author rodionov
 */
import "../../../Utils/expect.dart";

void check(String str, String pattern, List<String> expected,
    {bool multiLine: false, bool caseSensitive: true}) {
  RegExp re = new RegExp(pattern, multiLine: multiLine,
      caseSensitive: caseSensitive);
  Match m = re.firstMatch(str);
  Expect.equals(expected.length, m.groupCount + 1);
  for(int i = 0; i < expected.length; i++) {
    Expect.equals(expected[i], m.group(i));
  }
}

main() {
  check("ABCDEF", "(([A-Z])*)", ["ABCDEF", "ABCDEF", "F"]);
  check("a", r"((((((((a))))))))", ["a","a","a","a","a","a","a","a","a"]);
  check("AEKFCD", r"(ab|cd)+|ef", ["CD", "CD"], caseSensitive: false);
  check("abc", r"((a)|(ab))((c)|(bc))", ["abc", "a", "a", null, "bc", null, "bc"]);
  check("aa", r"(a)(\1)", ["aa", "a", "a"]);
  check("a", r"[a-z]", ["a"]);
}
