/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Match matchAsPrefix(String string, [int start = 0])
 * Match this pattern against the start of string.
 * ...
 * @description Checks that if str is null then exception is thrown
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";
 
main() {
  check("AE", 0, false, true);
  check("(a|cd)+|ef", 1, false, true);
  check(".+: gr(a|e)y", 1, false, false);
  check("((a)|(ab))((c)|(bc))", 0, false, false);
  check(r"^(a+)\1*,\1+$", 1, false, false);
  check(r"^(a+?)\1*,\1+$", 0, true, false);
  check("(z)((a+)?(b+)?(c))*", 0, true, true);
}

void check(String pattern, int start, bool multiLine,
    bool ignoreCase) {
  RegExp re = new RegExp(pattern, multiLine: multiLine,
      caseSensitive: !ignoreCase);
  Expect.throws(() {re.matchAsPrefix(null, start);});
}
