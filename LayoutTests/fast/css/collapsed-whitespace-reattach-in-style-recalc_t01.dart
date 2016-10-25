/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description This test ensures that we properly reattach collapsed
 * whitespace when sibling style changes require. Test passes if the spans
 * below are justified across the page.
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  var style = new Element.html('''
      <style>
      div {
          text-align: justify;
      }

      .inlineBlock {
          display: inline-block;
      }

      span {
          display: block;
      }

      div:after {
          content: '';
          display: inline-block;
          width: 100%;
      }

      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      <div id="container">
          <span>Item 1</span>
          <span>Item 2</span>
          <span>Item 3</span>
      </div>
      ''', treeSanitizer: new NullTreeSanitizer());

  dynamic spans = document.getElementsByTagName("span");
  for (var i = spans.length - 1; i >= 0; i--)
    spans[i].classes.add('inlineBlock');

  shouldBeGreaterThanOrEqual(spans[spans.length - 1].offsetLeft, 400);
}
