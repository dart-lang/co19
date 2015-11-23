/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If the first line of a multiline string consists solely of the
 * whitespace characters defined by the production WHITESPACE, possibly
 * prefixed by \, then that line is ignored, including the new line at its end.
 * @description Checks that the first new-line in a multi-line string is
 * ignored.
 * @author iefremov
 * @reviewer rodionov
 */
import '../../../Utils/expect.dart';


main() {
  var s1 = """
""";
  Expect.stringEquals("""""", s1,
      "The first new-line character in a multi-line string should be ignored!");

  s1 = '''
''';
  Expect.stringEquals('''''', s1,
      "The first new-line character in a multi-line string should be ignored!");

  // newline prefixed by \
  s1 = """\
""";
  Expect.stringEquals("""""", s1,
      "The first new-line character in a multi-line string should be ignored!");

  s1 = '''\
''';
  Expect.stringEquals('''''', s1,
      "The first new-line character in a multi-line string should be ignored!");

  // space and newline prefixed by \
  s1 = """\ \
""";
  Expect.stringEquals("""""", s1,
      "The first new-line character in a multi-line string should be ignored!");

  s1 = '''\ \
''';
  Expect.stringEquals('''''', s1,
      "The first new-line character in a multi-line string should be ignored!");

  // tabs and spaces at the beginning of a multiline string
  s1 = """  	  
abyr, abyr
abyrvalg
""";
  Expect.stringEquals("""abyr, abyr
abyrvalg
""", s1);
}
