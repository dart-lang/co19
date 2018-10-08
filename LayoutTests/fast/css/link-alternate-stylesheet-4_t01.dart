/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Alternate stylesheet (link) title test 4
 */
import "dart:html";
import "../../testcommon.dart";
import "pwd.dart";

main() {
  var links = new DocumentFragment.html('''
      <link rel="stylesheet" href="$root/resources/basic.css" type="text/css">
      <link rel="stylesheet" href="$root/resources/small.css" type="text/css">
      <link rel="stylesheet" href="$root/resources/normal.css" type="text/css">
      <link rel="stylesheet" href="$root/resources/high.css" title="Layout" type="text/css">
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(links);

  document.body.setInnerHtml('''
      <h1 id="firstH1">Alternate stylesheets</h1>
      
      <p id="textLine">This document has 4 stylesheets, with no alternate stylesheets but the "high.css" stylesheet now
        has a title attribute.</p>
      
      <ul>
        <li>Have a red border at the top of the page</li>
        <li>12px text</li>
      </ul>
      ''', treeSanitizer: new NullTreeSanitizer());

  asyncStart();
  window.onLoad.listen((_) {
    var element = document.getElementById("firstH1");
    shouldBe(getComputedStyle(element).getPropertyValue('text-decoration'), 'none solid rgb(51, 51, 51)');

    element = document.getElementById("textLine");
    shouldBe(getComputedStyle(element).getPropertyValue('font-size'), '12px');

    shouldBe(getComputedStyle(document.body).getPropertyValue('border-top-color'), 'rgb(139, 0, 0)');

    asyncEnd();
  });
}
