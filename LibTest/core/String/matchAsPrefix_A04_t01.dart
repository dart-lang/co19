/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
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
  check("AE", 0);
  check("(a|cd)+|ef", 1);
  check(".+: gr(a|e)y", 1);
  check("((a)|(ab))((c)|(bc))", 0);
  check(r"^(a+)\1*,\1+$", 1);
  check(r"^(a+?)\1*,\1+$", 0);
  check("(z)((a+)?(b+)?(c))*", 0);
}

void check(String pattern, int start) {
  Expect.throws(() {pattern.matchAsPrefix(null, start);});
}
