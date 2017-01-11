/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion String splitMapJoin(
 *  Pattern pattern, {
 *  String onMatch(
 *  Match match
 *  ),
 *  String onNonMatch(
 *  String nonMatch
 *  )
 *  })
 *  Splits the string, converts its parts, and combines them into a new string.
 *
 *  pattern is used to split the string into parts and separating matches.
 *
 *  Each match is converted to a string by calling onMatch. If onMatch is
 *  omitted, the matched string is used.
 *
 *  Each non-matched part is converted by a call to onNonMatch. If onNonMatch is
 *  omitted, the non-matching part is used.
 *
 *  Then all the converted parts are combined into the resulting string.
 * @description Checks that match argument of onNonMatch method is correct
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

main() {
  check("11231233", "2", ["11", "31", "33"]);
  check("11231233", new RegExp("2"), ["11", "31", "33"]);
  check("11 23 12 33", new RegExp("\\s"), ["11", "23", "12", "33"]);
}

check(String str, Pattern pattern, List expected) {
  int count = 0;
  str.splitMapJoin(pattern, onNonMatch: (m) {
    Expect.equals(expected[count++], m);
    return "";
  });
}
