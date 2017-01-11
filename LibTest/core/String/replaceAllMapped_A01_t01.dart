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
 * @description Checks that this method replaces all matched substrings
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

main() {
  Expect.equals("0230", "1231".replaceAllMapped("1", (m) => "0"));
  Expect.equals("031", "1231".replaceAllMapped("12", (m) => "0"));
  Expect.equals("101", "1231".replaceAllMapped("23", (m) => "0"));
  Expect.equals("12031", "12\w31".replaceAllMapped("\w", (m) => "0"));
  Expect.equals("12031", r"12\w31".replaceAllMapped(r"\w", (m) => "0"));
  Expect.equals("01231", "[:alpha:]1231".replaceAllMapped("[:alpha:]", (m) => "0"));
}
