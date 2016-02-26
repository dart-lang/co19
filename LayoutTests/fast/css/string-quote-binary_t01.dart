/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description This test checks if CSS string values are correctly serialized
 * when they contain binary characters.
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  var inputs = ["'\\0\\1\\2\\3\\4\\5\\6\\7\\8\\9\\a\\b\\c\\d\\e\\f'",
      "'\\10\\11\\12\\13\\14\\15\\16\\17\\18\\19\\1a\\1b\\1c\\1d\\1e\\1f\\7f'",
      "'\\A\\B\\C\\D\\E\\F\\1A\\1B\\1C\\1D\\1E\\1F\\7F'",
      "'\\0 \\1 \\2 '",
      "'\\0  \\1  \\2  '",
      "'\\0   \\1   \\2   '",
      "'\\00000f\\00000g'",
      "'\\0 0\\0 1\\0 2\\0 3\\0 4\\0 5\\0 6\\0 7\\0 8\\0 9'",
      "'\\0 A\\0 B\\0 C\\0 D\\0 E\\0 F\\0 G'",
      "'\\0 a\\0 b\\0 c\\0 d\\0 e\\0 f\\0 g'"];
  var expected = ["'\uFFFD\\1\\2\\3\\4\\5\\6\\7\\8\\9\\a\\b\\c\\d\\e\\f'",
      "'\\10\\11\\12\\13\\14\\15\\16\\17\\18\\19\\1a\\1b\\1c\\1d\\1e\\1f\\7f'",
      "'\\a\\b\\c\\d\\e\\f\\1a\\1b\\1c\\1d\\1e\\1f\\7f'",
      "'\uFFFD\\1\\2'",          // No space after each control character.
      "'\uFFFD  \\1  \\2  '",    // One space delimiter (that will be ignored by the CSS parser), plus one actual space.
      "'\uFFFD   \\1   \\2   '", // One space delimiter, plus two actual spaces.
      "'\\f\uFFFDg'",
      "'\uFFFD 0\uFFFD 1\uFFFD 2\uFFFD 3\uFFFD 4\uFFFD 5\uFFFD 6\uFFFD 7\uFFFD 8\uFFFD 9'", // Need a space before [0-9A-Fa-f], but not before [Gg].
      "'\uFFFD A\uFFFD B\uFFFD C\uFFFD D\uFFFD E\uFFFD F\uFFFDG'",
      "'\uFFFD a\uFFFD b\uFFFD c\uFFFD d\uFFFD e\uFFFD f\uFFFDg'"];

  var testElement = document.createElement('div');
  for (var i = 0; i < inputs.length; ++i) {
    testElement.style.fontFamily = inputs[i];
    shouldBeLikeString(testElement.style.fontFamily, expected[i]);
  }
}
