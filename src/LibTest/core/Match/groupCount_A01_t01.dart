/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Returns the number of groups in the regular expression. 
 * @description Checks that method returns correct value.
 * @author rodionov
 * @reviewer msyabro
 */

void check(String str, String pattern, int quantity, [bool multiLine = false, bool ignoreCase = false]) {
  RegExp re = new RegExp(pattern, multiLine, ignoreCase);
  Match m = re.firstMatch(str);
  Expect.equals(quantity, m.groupCount());
}
 
void main() {
  check("ABCDEF", @"(([A-Z])*)", 2);
  check("a", @"((((((((a))))))))", 8);
  check("AEKFCD", @"(ab|cd)+|ef", 1, ignoreCase: true);
  check("abc", @"((a)|(ab))((c)|(bc))", 6);
  check("aa", @"(a)(\1)", 2);
  check("a", @"[a-z]", 0);
}
