/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Test parsing a CSS URI containing a multi-byte Unicode escape sequence.
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  dynamic style = new Element.html(r'''
      <style>#test { background-image: url("data:\100")} #test { background-color: green !important }</style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      <div id="test" style="width: 100px; height: 100px; background-color: red"></div>
      ''', treeSanitizer: new NullTreeSanitizer());

  shouldBe(style.sheet.cssRules.length, 2);
  shouldBeEqualToString(stripQuotes(style.sheet.cssRules[0].style.getPropertyValue("background-image")), 'url(data:%C4%80)');
  shouldBeEqualToString(style.sheet.cssRules[1].style.getPropertyValue("background-color"), 'green');
  shouldBeEqualToString(getComputedStyle(document.getElementById("test")).getPropertyValue("background-color"), 'rgb(0, 128, 0)');
}
