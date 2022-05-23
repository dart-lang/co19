// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion String replaceFirstMapped(Pattern from,
/// String replace(Match match), [int startIndex = 0])
/// Replace the first occurrence of from in this string.
///
/// Returns a new string, which is this string except that the first match of
/// pattern, starting from startIndex, is replaced by the result of calling
/// replace with the match object.
/// @description Checks that this method replaces the first matched substring
/// only. Test that RegEx can be used as from pattern
/// @author sgrekhov@unipro.ru

import "../../../Utils/expect.dart";

main() {
  Expect.equals("0231", "1231".replaceFirstMapped(new RegExp("1"), (m) => "0"));
  Expect.equals("12031\w", "12\w31\w".replaceFirstMapped(new RegExp("\w"),
      (m) => "0"));
  Expect.equals(r"02\w31\w", r"12\w31\w".replaceFirstMapped(new RegExp(r"\w"),
      (m) => "0"));
  Expect.equals("abc-1231 5", "abc 1231 5".replaceFirstMapped(new RegExp("\\s"),
      (m) => "-"));
}
