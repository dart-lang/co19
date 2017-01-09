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
 * In that case, this patten is tested against the string at the start position.
 * That is, a Match is returned if the pattern can match a part of the string
 * starting from position start. Returns null if the pattern doesn't match.
 * @description Checks that the returned Match is correctly initialized.
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";
 
main() {
  check("AE", "AEKFCD", [0, 2, "AE"]);
  check("acd", "acdKFCD", [0, 3, "acd"]);
  check("AB", "abcdefg", null);
  check("AB", "ABcdefg", [0, 2, "AB"]);
  check("\s", " ABcdefg", null);
  check(":alpha:", "ABcdefg", null);
  check(":alpha:", ":alphaABcdefg", null);
  check(":alpha:", ":alpha:ABcdefg", [0, 7, ":alpha:"]);
}

void check(String pattern, String str, List groupData) {
  Match fm = pattern.matchAsPrefix(str);
  if(fm == null && groupData != null) {
    Expect.fail("Nothing found for pattern <$pattern> in string <$str>");
  }
  if (groupData == null) {
    Expect.isNull(fm);
    return;
  }
  Expect.equals(str, fm.input);
  Expect.equals(pattern, fm.pattern);
  Expect.equals(groupData.length, 3);
  Expect.equals(groupData[0], fm.start);
  Expect.equals(groupData[1], fm.end);
  Expect.equals(groupData[2], fm.group(0));
}
