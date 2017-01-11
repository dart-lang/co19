/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Returns an ordered collection of matches of the regular expression
 * in [str]. The order in the collection is the order of the matches found
 * in [str].
 * @description Checks that all matches are returned in correct order
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";
 
main() {
  check("as", "paspaspas", ["as", "as", "as"]);
  check("p", "paspaspasp", ["p", "p", "p", "p"]);
  check("p.", "paspaspasp.", ["p."]);
  check(r"\s", r"pa\spa spasps", [r"\s"]);
  check(r"\w", "1 a \\w", ["\\w"]);
}
  
void check(String pattern, String str, List expMatchesData) {
  Iterable<Match> matches = pattern.allMatches(str);
  if(matches.length == 0) {
    Expect.fail("Nothing found for pattern <$pattern> in string <$str>");
  }
  Expect.equals(expMatchesData.length, matches.length);
  for (int i = 0; i < matches.length; i++) {
    String sub = str.substring(matches.elementAt(i).start, matches.elementAt(i).end);
    Expect.equals(expMatchesData[i], sub);
  }
}
