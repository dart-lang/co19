/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Tests that the width keywords are respected by the parser and
 * then returned by the style object.
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
      <div style="width: -webkit-min-content"></div>
      <div style="width: -webkit-max-content"></div>
      <div style="width: -webkit-fill-available"></div>
      <div style="width: -webkit-fit-content"></div>
      ''', treeSanitizer: new NullTreeSanitizer());

  var divs = document.querySelectorAll('div');
  for (var i = 0; i < divs.length; ++i) {
    debug(divs[i].style.width);
  }

  var PREFIX = '-webkit-';
  var KEYWORDS = ['min-content', 'max-content', 'fill-available',  'fit-content'];
  var div;

  KEYWORDS.forEach((keyword) {
    div = document.createElement('div');
    div.style.width = PREFIX + keyword;
    shouldBeEqualToString(div.style.width, PREFIX + keyword);
  });
}
