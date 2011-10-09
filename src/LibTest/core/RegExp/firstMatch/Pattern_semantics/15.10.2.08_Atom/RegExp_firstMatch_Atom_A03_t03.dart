/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion 15.10.2.8: Parentheses of the form ( Disjunction ) serve both to
 *            group the components of the Disjunction pattern together and to
 *            save the result of the match. The result can be used either in a
 *            backreference (\ followed by a nonzero decimal number), referenced
 *            in a replace String, or returned as part of an array from the
 *            regular expression matching internal procedure.
 * @description Checks that the contents of parentheses are correctly captured.
 * @3rdparty sputnik-v1:S15.10.2.8_A3_T17.js
 * @author rodionov
 */
 

main() {
  String body = @"""
<body onXXX="alert(event.type);">
<p>Kibology for all</p>
<p>All for Kibology</p>
</body>""";
  String html = "<html>\n" + body + "\n</html>";
  check(@"<body.*>((.*\n?)*?)</body>", html, "i", 7, 
      [body, "\n<p>Kibology for all</p>\n<p>All for Kibology</p>\n", "<p>All for Kibology</p>\n"]);
}

void check(String pattern, String str, String flags = "", int matchPos = -1, Array<String> expectedGroups = null) {
  Logger.println("\nPattern: \"$pattern\"\n" +
      "String: \"$str\"\n" +
      "Flags: \"$flags\"\n" +
      "Exp. groups: \"$expectedGroups\"");
  RegExp re = new RegExp(pattern, flags);
  Match fm = re.firstMatch(str);
  Logger.println("group count: " + fm.groupCount());
  if(null == fm) {
    Expect.fail("\"$pattern\" !~ \"$str\"");
  }
  if(matchPos >= 0) {
    Expect.equals(matchPos, fm.start(0));
  }
  if(null != expectedGroups) {
    Expect.equals(expectedGroups.length, fm.groupCount() + 1);
    
    for(int i = 0; i <= fm.groupCount(); i++) {
      String expGr = expectedGroups[i];
      String actGr = fm.group(i);
      Logger.println("\t$expGr == $actGr ??");
      if(expGr != actGr) {
        Expect.fail("Mismatch at group $i: \"$expGr\" expected instead of \"$actGr\"");
      }
    }
  }
}

void checkNeg(String pattern, String str, String flags = "") {
  RegExp re = new RegExp(pattern, flags);
  if(null != re.firstMatch(str)) {
    Expect.fail("\"$pattern\" ~ \"$str\"");
  }
}
