/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Returns the index in the string where the match starts.
 * @description Checks that method returns correct value.
 * @author rodionov
 */
import "../../../Utils/expect.dart";

void check(String str, String pattern, int start) {
  RegExp re = new RegExp(pattern, multiLine: false, caseSensitive: true);
  Match m = re.firstMatch(str);
  Expect.equals(start, m.start);
}

main(){
  check("", "", 0);
  check("", ".*", 0);
  check("a", "a", 0);
  check("abcdef", "[a-z]", 0);
  check("abcdef", "[a-z]+", 0);
  check("abcdef", "[b-z]+", 1);
  check("abcdef", "[a-e]+", 0);
}

