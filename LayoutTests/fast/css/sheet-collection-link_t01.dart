/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Test that the styleSheet collection contains all sheets
 * referenced through the <link> elements. See bug #22429.
 */
import "dart:html";
import "../../testcommon.dart";
import "pwd.dart";

main() {
  var index = document.getElementsByTagName("style").length; // skip test framework's ones

  var f = new DocumentFragment.html('''
      <link media="all" href="$root/resources/background_image.css" rel="stylesheet">
      <link media="aural" href="$root/resources/background_image.css" rel="stylesheet">
      <link media="braille" href="$root/resources/background_image.css" rel="stylesheet">
      <link media="embossed" href="$root/resources/background_image.css" rel="stylesheet">
      <link media="handheld" href="$root/resources/background_image.css" rel="stylesheet">
      <link media="print" href="$root/resources/background_image.css" rel="stylesheet">
      <link media="projection" href="$root/resources/background_image.css" rel="stylesheet">
      <link media="screen" href="$root/resources/background_image.css" rel="stylesheet">
      <link media="tty" href="$root/resources/background_image.css" rel="stylesheet">
      <link media="tv" href="$root/resources/background_image.css" rel="stylesheet">
      <link media="invalid" href="$root/resources/background_image.css" rel="stylesheet">
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(f);

  runTest(_) {
    dynamic sheets = document.styleSheets;
    shouldBe(sheets.length, index+11);
    for (var i = index; i < index+11; i++) {
      debug('test$i');
      shouldBe(sheets[i].cssRules.length, 1);
      shouldBe(sheets[i].cssRules[0].type, CssRule.STYLE_RULE);
      shouldNotBe(sheets[i].cssRules[0].style.getPropertyValue("background-image"), '');
    }
    asyncEnd();
  }

  asyncStart();
  window.onLoad.listen(runTest);
}
