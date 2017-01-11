/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion String replaceFirstMapped(Pattern from,
 * String replace(Match match), [int startIndex = 0])
 * Replace the first occurence of from in this string.
 *
 * Returns a new string, which is this string except that the first match of
 * pattern, starting from startIndex, is replaced by the result of calling
 * replace with the match object.
 * @description Checks that this method replaces the first matched substring
 * only, starting from start
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

main() {
  Expect.equals("1230", "1231".replaceFirstMapped("1", (m) => "0", 1));
  Expect.equals("12310", "123112".replaceFirstMapped("12", (m) => "0", 1));
  Expect.equals("12301", "123231".replaceFirstMapped("23", (m) => "0", 3));
  Expect.equals("12\w310", "12\w31\w".replaceFirstMapped("\w", (m) => "0", 3));
  Expect.equals("12\\w031", r"12\w\w31".replaceFirstMapped(r"\w", (m) => "0", 3));
  Expect.equals("[:alpha:]01231", "[:alpha:][:alpha:]1231".replaceFirstMapped(
      "[:alpha:]", (m) => "0", 2));
}
