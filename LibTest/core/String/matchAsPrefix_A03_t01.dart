/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
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
  check("AE", "AEKFCD", -1);
  check("(a|cd)+|ef", "AEKFCD", 7);
  check(".+: gr(a|e)y", "color: grey", 100);
  check("((a)|(ab))((c)|(bc))", "abc", 45);
  check(r"^(a+)\1*,\1+$", "aaaaaaaaa,aaaaaa", -1);
  check(r"^(a+?)\1*,\1+$", "aaaaaa,aaaaaaaaa", 112);
  check("(z)((a+)?(b+)?(c))*", "zaacbbbcac", 22);
}

void check(String pattern, String str, int start) {
  Expect.throws(() {pattern.matchAsPrefix(str, start);});
}
