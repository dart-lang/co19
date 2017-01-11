/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion String replaceAllMapped(Pattern from, String replace(Match match))
 * Replace all substrings that match from by a string computed from the match.
 * Returns a new string in which the non-overlapping substrings that match from
 * (the ones iterated by from.allMatches(thisString)) are replaced by the result
 * of calling replace on the corresponding Match object.
 * @description Checks that only non-overlapped substrings are replaced
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

main() {
  Expect.equals("ba", "aaa".replaceAllMapped("aa", (m) => "b"));
  Expect.equals("bb", "aaaa".replaceAllMapped("aa", (m) => "b"));
}
