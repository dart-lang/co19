/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Adjacent single line strings are implicitly concatenated
 * to form a single string literal.
 * @description Checks the value of concatenated string literal.
 * @author msyabro
 * @needsreview Issue 2102
 */


main() {
  Expect.equals("", ""'');
  Expect.equals('a', 'a''');
  Expect.equals('a', '''a');
  Expect.equals('ab', 'a''b');
  Expect.equals("12", "1""2");
  Expect.equals(@'\n\n', @'\n'@'\n');
  Expect.equals("a", ""@"a");
  Expect.equals('ab', @'a'"b");
  Expect.equals('string', 's''t''r''i''n''g');
  Expect.equals("22", '${1 + 1}' "${3 - 1}");
  var s = 'a'
          "b"
          '''c'''
          """d"""
          """
e"""
          '''
f''';
  Expect.equals('abcdef', s);
}
