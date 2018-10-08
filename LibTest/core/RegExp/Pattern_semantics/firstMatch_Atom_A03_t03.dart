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
 *            in a replace String, or returned as part of a list from the
 *            regular expression matching internal procedure.
 * @description Checks that the contents of parentheses are correctly captured.
 * More complex test.
 * @3rdparty sputnik-v1:S15.10.2.8_A3_T17.js
 * @author rodionov
 * @reviewer pagolubev
 */
import "../../../../Utils/expect.dart";
 

main() {
  String body = r"""
<body onXXX="alert(event.type);">
<p>Kibology for all</p>
<p>All for Kibology</p>
</body>""";
  String html = "<html>\n$body\n</html>";
  check(r"<body.*>((.*\n?)*?)</body>", html, ignoreCase:true , matchPos: 7,
      expectedGroups: [body,
      "\n<p>Kibology for all</p>\n<p>All for Kibology</p>\n",
      "<p>All for Kibology</p>\n"]);
}

void check(String pattern, String str, {bool multiLine: false,
    bool ignoreCase: false, int matchPos: -1,
    List<String> expectedGroups: null}) {
  RegExp re = new RegExp(pattern, multiLine: multiLine,
      caseSensitive: !ignoreCase);
  Match fm = re.firstMatch(str);
  if(null == fm) {
    Expect.fail("\"$pattern\" !~ \"$str\"");
  }
  if(matchPos >= 0) {
    Expect.equals(matchPos, fm.start);
  }
  if(null != expectedGroups) {
    Expect.equals(expectedGroups.length, fm.groupCount + 1);
    
    for(int i = 0; i <= fm.groupCount; i++) {
      String expGr = expectedGroups[i];
      String actGr = fm.group(i);
      if(expGr != actGr) {
        Expect.fail("Mismatch at group $i: \"$expGr\" expected instead of \"$actGr\"");
      }
    }
  }
}
