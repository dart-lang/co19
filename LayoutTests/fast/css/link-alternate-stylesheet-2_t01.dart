/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Alternate stylesheet (link) title test 2
 */
import "dart:html";
import "../../testcommon.dart";
import "pwd.dart";

main() {
  var links = new DocumentFragment.html('''
      <link rel="stylesheet" href="$root/resources/basic.css" type="text/css" />
      <link rel="stylesheet" href="$root/resources/small.css" type="text/css" />
      <link rel="stylesheet" href="$root/resources/normal.css" type="text/css" />
      <link rel="alternate stylesheet" href="$root/resources/high.css" type="text/css" />
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(links);

  document.body.setInnerHtml('''
      <h1 id="firstH1">Alternate stylesheets</h1>
      
      <p id="textLine">This document has 3 stylesheets, with 1 alternate stylesheet without title. It should:</p>
      
      <ul>
        <li>Have a green border at the top of the page</li>
        <li>An underlined <code>H1</code></li>
        <li>12px text</li>
      </ul>
      ''', treeSanitizer: new NullTreeSanitizer());

  asyncStart();
  window.onLoad.listen((_) {
    var element = document.getElementById("firstH1");
    shouldBe(getComputedStyle(element).getPropertyValue('text-decoration'), 'underline solid rgb(51, 51, 51)');

    element = document.getElementById("textLine");
    shouldBe(getComputedStyle(element).getPropertyValue('font-size'), '12px');

    shouldBe(getComputedStyle(document.body).getPropertyValue('border-top-color'), 'rgb(0, 128, 0)');

    asyncEnd();
  });
}
