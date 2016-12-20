/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Match matchAsPrefix(String string, [int start = 0])
 * Match this pattern against the start of string.
 *
 * If start is provided, it must be an integer in the range 0 .. string.length.
 * ...
 * @description Checks that if start is provided, it must be an integer
 * in the range 0 .. string.length.
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";
 
main() {
  check("AE", "AEKFCD", -1, false, true);
  check("(a|cd)+|ef", "AEKFCD", 7, false, true);
  check(".+: gr(a|e)y", "color: grey", 100, false, false);
  check("((a)|(ab))((c)|(bc))", "abc", 45, false, false);
  check(r"^(a+)\1*,\1+$", "aaaaaaaaa,aaaaaa", -1, false, false);
  check(r"^(a+?)\1*,\1+$", "aaaaaa,aaaaaaaaa", 112, false, false);
  check("(z)((a+)?(b+)?(c))*", "zaacbbbcac", 22, false, false);
}

void check(String pattern, String str, int start, bool multiLine,
    bool ignoreCase) {
  RegExp re = new RegExp(pattern, multiLine: multiLine,
      caseSensitive: !ignoreCase);
  Expect.throws(() {re.matchAsPrefix(str, start);});
}
