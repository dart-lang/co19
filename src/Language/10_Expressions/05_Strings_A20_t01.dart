/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The first new-line character in a multi-line string is ignored (?)
 * @description Checks that the first new-line in a multi-line string is ignored.
 * @author iefremov
 * @needsreview undocumented
 * @needsreview issue 240
 */


main() {
  var s1 = """
""";
  Expect.identical("""""", s1, "The first new-line character in a multi-line string should be ignored!");

  s1 = '''
''';
  Expect.identical('''''', s1, "The first new-line character in a multi-line string should be ignored!");

  s1 = """
abyr, abyr
abyrvalg
""";
  Expect.identical("""abyr, abyr\nabyrvalg\n""", s1);
}
