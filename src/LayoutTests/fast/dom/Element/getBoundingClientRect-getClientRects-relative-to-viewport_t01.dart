/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description 
 */
import "dart:html";
import "../../../../Utils/expect.dart";
import "../../../testcommon.dart";

main() {
  var style = new Element.html('''
    <style>
        #pusher {
            width: 1000px;
            height: 1000px;
            outline: 1px solid black;
        }
    </style>
    ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);
 
  document.body.setInnerHtml('''
    <div id="testArea">
        <br>
        <p id="test">Test content</p>
        <div id="pusher">This box is here to create scrollbars.</div>
    </div>
    ''', treeSanitizer: new NullTreeSanitizer());

  var element = document.getElementById('test');

  // Get base numbers
  var unScrolledBoundingBox = element.getBoundingClientRect();
  var unScrolledBoundingBoxes = element.getClientRects();

  // Test scrolling down
  window.scrollBy(0, 50);
  var scrolledDownBoundingBox = element.getBoundingClientRect();
  var scrolledDownBoundingBoxes = element.getClientRects();

  // Reset
  window.scrollTo(0, 0);

  // Test scrolling right
  window.scrollBy(50, 0);
  var scrolledRightBoundingBox = element.getBoundingClientRect();
  var scrolledRightBoundingBoxes = element.getClientRects();

  // Reset
  window.scrollTo(0, 0);

  Expect.equals(50, unScrolledBoundingBox.top - scrolledDownBoundingBox.top, 'test1');
  Expect.equals(50, unScrolledBoundingBoxes[0].top - scrolledDownBoundingBoxes[0].top, 'test2');
  Expect.equals(50, unScrolledBoundingBox.left - scrolledRightBoundingBox.left, 'test3');
  Expect.equals(50, unScrolledBoundingBoxes[0].left - scrolledRightBoundingBoxes[0].left, 'test4');
}
