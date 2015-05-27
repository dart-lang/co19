/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description 
 */
import "dart:html";
import "../../testcommon.dart";
import "../../../Utils/async_utils.dart";

main() {
  var style = new Element.html('''
      <style>
          #container {
              padding: 100px 150px 100px 50px;
              width: 200px; height: 200px;
              background-color: lightgray;
          }
          #outerBox {
              width: 100px; height: 100px;
              padding: 50px 0 50px 100px;
              border-radius: 10px;
              background-color: lightgreen;
          }
          #innerBox {
              width: 200px; height: 100px;
              background-color: green;
          }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      <p>Test for <i>bug 113591</i>: <a href="https://bugs.webkit.org/show_bug.cgi?id=113591">https://bugs.webkit.org/show_bug.cgi?id=113591</a> REGRESSION (r145870): Can't get insertion point to appear in some input and textareas on wordpress</p>
      <div id="container">
          <div id="outerBox">
              <div id="innerBox"></div>
          </div>
      </div>
      <div id="console"></div>
      ''', treeSanitizer: new NullTreeSanitizer());

  var x, y;

  offset(elem) {
    var left = 0;
    var top = 0;
    for (; elem != null; elem = elem.offsetParent) {
      left += elem.offsetLeft;
      top += elem.offsetTop;
    }
    return [left, top];
  }

  var innerBox = document.getElementById('innerBox');
  x = offset(innerBox)[0];
  y = offset(innerBox)[1];

  shouldBe(document.elementFromPoint(x + 5, y - 5).id, 'outerBox');
  shouldBe(document.elementFromPoint(x + 5, y + 5).id, 'innerBox');
  shouldBe(document.elementFromPoint(x + 5, y + 95).id, 'innerBox');
  shouldBe(document.elementFromPoint(x + 5, y + 105).id, 'outerBox');
  shouldBe(document.elementFromPoint(x + 95, y - 5).id, 'outerBox');
  shouldBe(document.elementFromPoint(x + 95, y + 5).id, 'innerBox');
  shouldBe(document.elementFromPoint(x + 95, y + 95).id, 'innerBox');
  shouldBe(document.elementFromPoint(x + 95, y + 105).id, 'outerBox');
  shouldBe(document.elementFromPoint(x + 105, y - 5).id, 'container');
  shouldBe(document.elementFromPoint(x + 105, y + 5).id, 'innerBox');
  shouldBe(document.elementFromPoint(x + 105, y + 95).id, 'innerBox');
  shouldBe(document.elementFromPoint(x + 105, y + 105).id, 'container');
  shouldBe(document.elementFromPoint(x + 195, y - 5).id, 'container');
  shouldBe(document.elementFromPoint(x + 195, y + 5).id, 'innerBox');
  shouldBe(document.elementFromPoint(x + 195, y + 95).id, 'innerBox');
  shouldBe(document.elementFromPoint(x + 195, y + 105).id, 'container');
}
