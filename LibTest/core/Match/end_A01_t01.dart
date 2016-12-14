/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Returns the index in the string after the last character of the
 * match.
 * @description Checks that method returns correct value for various regular
 * expressions
 * @author rodionov
 */
import "../../../Utils/expect.dart";

void check(String str, String pattern, int end) {
  RegExp re = new RegExp(pattern, multiLine: false, caseSensitive: true);
  Match m = re.firstMatch(str);
  Expect.equals(end, m.end);
}

main(){
  check("", "", 0);
  check("", ".*", 0);
  check("a", "a", 1);
  check("abcdef", "[a-z]", 1);
  check("abcdef", "[a-z]+", 6);
  check("abcdef", "[b-z]+", 6);
  check("abcdef", "[a-e]+", 5);
  check("abcdef", "e(?=f)", 5);
}
