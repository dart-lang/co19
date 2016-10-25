/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description CSS Aspect Ratio Parsing Test
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
      <p id="description"></p>
      <div id="console"></div>
      <div id="aspectRatioTest"></div>
      ''', treeSanitizer: new NullTreeSanitizer());

  testParsing(elementId, value, styleAttribute)
  {
    var div = document.getElementById(elementId);
    div.style.setProperty(styleAttribute, value);
    return div.style.getPropertyValue(styleAttribute);
  }

  shouldBeEqualToString(testParsing("aspectRatioTest", "2/1", "-webkit-aspect-ratio"), '2/1');
  shouldBeEqualToString(testParsing("aspectRatioTest", "1/1", "-webkit-aspect-ratio"), '1/1');
  shouldBeEqualToString(testParsing("aspectRatioTest", "1/4", "-webkit-aspect-ratio"), '1/4');
  shouldBeEqualToString(testParsing("aspectRatioTest", "1 / 2", "-webkit-aspect-ratio"), '1/2');
  shouldBeEqualToString(testParsing("aspectRatioTest", "1.2 / 2", "-webkit-aspect-ratio"), '1.2/2');
  shouldBeEqualToString(testParsing("aspectRatioTest", "2 / 0.5", "-webkit-aspect-ratio"), '2/0.5');
  shouldBeEqualToString(testParsing("aspectRatioTest", "inherit", "-webkit-aspect-ratio"), 'inherit');
  shouldBeEqualToString(testParsing("aspectRatioTest", "none", "-webkit-aspect-ratio"), 'none');

  // The following are invalid and should get ignored.
  shouldBeEqualToString(testParsing("aspectRatioTest", "1 2", "-webkit-aspect-ratio"), 'none');
  shouldBeEqualToString(testParsing("aspectRatioTest", "a/1", "-webkit-aspect-ratio"), 'none');
  shouldBeEqualToString(testParsing("aspectRatioTest", "1/a", "-webkit-aspect-ratio"), 'none');
  shouldBeEqualToString(testParsing("aspectRatioTest", "abc123", "-webkit-aspect-ratio"), 'none');
  shouldBeEqualToString(testParsing("aspectRatioTest", "1", "-webkit-aspect-ratio"), 'none');
  shouldBeEqualToString(testParsing("aspectRatioTest", "1 / 0", "-webkit-aspect-ratio"), 'none');
  shouldBeEqualToString(testParsing("aspectRatioTest", "0 / 1", "-webkit-aspect-ratio"), 'none');
  shouldBeEqualToString(testParsing("aspectRatioTest", "0 / 0", "-webkit-aspect-ratio"), 'none');
  shouldBeEqualToString(testParsing("aspectRatioTest", "-1 / 8", "-webkit-aspect-ratio"), 'none');
  shouldBeEqualToString(testParsing("aspectRatioTest", "1 / -9", "-webkit-aspect-ratio"), 'none');
  shouldBeEqualToString(testParsing("aspectRatioTest", "-1 / -4", "-webkit-aspect-ratio"), 'none');
}
