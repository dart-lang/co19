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
 * In that case, this patten is tested against the string at the start position.
 * That is, a Match is returned if the pattern can match a part of the string
 * starting from position start. Returns null if the pattern doesn't match.
 * @description Checks that the returned Match is correctly initialized. Test
 * not null start
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";
 
main() {
  check("AE", "AAEKFCD", 1, false, true, [1, 3, "AE"]);
  check("(a|cd)+|ef", "BBAEKFCD", 2, false, true, [2, 3, "A"]);
  check(".+: gr(a|e)y", "ccccolor: grey", 3, false, false, [3, 14,
        "color: grey"]);
  check("((a)|(ab))((c)|(bc))", "ccabc", 2, false, false, [2, 5, "abc"]);
  check("(z)((a+)?(b+)?(c))*", "zzaacbbbcac", 1, false, false,
        [1, 11, "zaacbbbcac"]);
}

void check(String pattern, String str, int start, bool multiLine,
    bool ignoreCase, List groupData) {
  RegExp re = new RegExp(
      pattern, multiLine: multiLine, caseSensitive: !ignoreCase);
  Match fm = re.matchAsPrefix(str, start);
  if(fm == null) {
    Expect.fail("\"$pattern\" !~ \"$str\"");
  }
  Expect.equals(str, fm.input);
  Expect.equals(pattern, (fm.pattern as RegExp).pattern);
  if(groupData != null) {
    Expect.equals(groupData.length, 3);
    Expect.equals(groupData[0], fm.start);
    Expect.equals(groupData[1], fm.end);
    Expect.equals(groupData[2], fm.group(0));
  }
}
