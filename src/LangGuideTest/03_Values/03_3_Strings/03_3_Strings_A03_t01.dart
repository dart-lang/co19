/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Dart also supports multi-line strings that are enclosed by triple-single-quotes or
 * triple-double-quotes. If a newline is immediately following the first triple-quote,
 * that newline is removed from the resulting string. Multi-line strings support the same
 * escape-sequences and string-interpolation feature as single-line strings described above.
 * @description Checks that multi-line strings that are enclosed by triple-single-quotes
 * or triple-double-quotes are valid and a newline following first triple-quotes is removed.
 * @author pagolubev
 * @reviewer akuznecov
 * @needsreview ''' ''' is not greedy-parsed, need check for that. Tabulation in multiline strings should be checked.
 * Two checks are the same?
 */


main() {
  String s = "First line\nSecond line\n";

  String s1 = """
First line
Second line
""";

  String s2 = """First line
Second line
""";

  Expect.isTrue(s1 == s);
  Expect.isTrue(s2 == s);

  s1 = """
First line
Second line
""";

  s2 = """First line
Second line
""";

  Expect.isTrue(s1 == s);
  Expect.isTrue(s2 == s);
}
