/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Adding the 'disabled' attribute to a link element causes it to
 * disable its stylesheet
 */
import "dart:html";
import "../../testcommon.dart";
import "pwd.dart";

main() {
  var links = new DocumentFragment.html('''
      <!-- This sheet should apply -->
      <link rel="stylesheet" href="$root/resources/red.css">
      <!-- But not this one -->
      <link rel="stylesheet" href="$root/resources/green.css" disabled>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(links);

  document.body.setInnerHtml('''
      <div id="test"></div>
      ''', treeSanitizer: new NullTreeSanitizer());

  asyncStart();
  window.onLoad.listen((_) {
    var testDiv = document.querySelector('div#test');
    shouldBeEqualToString(getComputedStyle(testDiv).backgroundColor, 'rgb(255, 0, 0)');
    dynamic disabledLink = document.querySelector('link[disabled]');
    shouldBeTrue(disabledLink.disabled);
    asyncEnd();
  });
}
