/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Tests that the height keywords are parsed.
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
      <!--
          Tests that the height keywords are not respected by the parser yet.
      -->
      <div style="height: -webkit-min-content; min-height: -webkit-min-content; max-height: -webkit-min-content;" expected-data="min-content"></div>
      <div style="height: -webkit-max-content; min-height: -webkit-max-content; max-height: -webkit-max-content;" expected-data="max-content"></div>
      <div style="height: -webkit-fill-available; min-height: -webkit-fill-available; max-height: -webkit-fill-available;" expected-data="fill-available"></div>
      <div style="height: -webkit-fit-content; min-height: -webkit-fit-content; max-height: -webkit-fit-content;" expected-data="fit-content"></div>
      ''', treeSanitizer: new NullTreeSanitizer());

  var PREFIX = '-webkit-';

  var divs = document.querySelectorAll('div.expected-data');
  for (var i = 0; i < divs.length; ++i) {
    shouldBe(divs[i].style.height, PREFIX + divs[i].getAttribute("expected-data"));
    shouldBe(divs[i].style.minHeight, PREFIX + divs[i].getAttribute("expected-data"));
    shouldBe(divs[i].style.maxHeight, PREFIX + divs[i].getAttribute("expected-data"));
  }

  var KEYWORDS = ['min-content', 'max-content', 'fill-available',  'fit-content'];
  var div;

  KEYWORDS.forEach((keyword) {
    div = document.createElement('div');
    div.style.height = PREFIX + keyword;
    div.style.minHeight = PREFIX + keyword;
    div.style.maxHeight = PREFIX + keyword;
    shouldBe(div.style.height, PREFIX + keyword);
    shouldBe(div.style.minHeight, PREFIX + keyword);
    shouldBe(div.style.maxHeight, PREFIX + keyword);
  });
}
