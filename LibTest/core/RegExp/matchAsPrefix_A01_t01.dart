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
 * @description Checks that the returned Match is correctly initialized.
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";
 
main() {
  check("AE", "AEKFCD", false, true, [0, 2, "AE"]);
  check("(a|cd)+|ef", "AEKFCD", false, true, [0, 1, "A"]);
  check(".+: gr(a|e)y", "color: grey", false, false, [0, 11, "color: grey"]);
  check("((a)|(ab))((c)|(bc))", "abc", false, false, [0, 3, "abc"]);
  check(r"^(a+)\1*,\1+$", "aaaaaaaaa,aaaaaa", false, false,
        [0, 16, "aaaaaaaaa,aaaaaa"]);
  check(r"^(a+?)\1*,\1+$", "aaaaaa,aaaaaaaaa", false, false,
        [0, 16, "aaaaaa,aaaaaaaaa"]);
  check("(z)((a+)?(b+)?(c))*", "zaacbbbcac", false, false,
        [0, 10, "zaacbbbcac"]);
}

void check(String pattern, String str, bool multiLine, bool ignoreCase,
    List groupData) {
  RegExp re = new RegExp(
      pattern, multiLine: multiLine, caseSensitive: !ignoreCase);
  Match fm = re.matchAsPrefix(str);
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
