/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Returns the number of groups in the regular expression. 
 * @description Checks that method returns correct value.
 * @author rodionov
 */
import "../../../Utils/expect.dart";

void check(String str, String pattern, int quantity,
    {bool multiLine: false, bool caseSensitive: true}) {
  RegExp re = new RegExp(pattern, multiLine: multiLine,
      caseSensitive: caseSensitive);
  Match m = re.firstMatch(str);
  Expect.equals(quantity, m.groupCount);
}
 
void main() {
  check("ABCDEF", r"(([A-Z])*)", 2);
  check("a", r"((((((((a))))))))", 8);
  check("AEKFCD", r"(ab|cd)+|ef", 1, caseSensitive: false);
  check("abc", r"((a)|(ab))((c)|(bc))", 6);
  check("aa", r"(a)(\1)", 2);
  check("a", r"[a-z]", 0);
}
