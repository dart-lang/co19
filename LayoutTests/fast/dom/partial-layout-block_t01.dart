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
import "../../resources/testharness.dart";

main() {
  var style = new Element.html('''
      <style>
      html, body {
          margin: 0;
          padding: 0;
      }

      #measure {
          margin: 10px;
          padding: 10px;
      }

      #fixedsize {
          width: 100px;
          height: 100px;
      }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      <div id="measure"><div id="fixedsize"></div></div>
      ''', treeSanitizer: new NullTreeSanitizer());

  test(() {
    var measure = document.getElementById('measure');

    // Record partial layout values for offset*.
    var measureWidth = measure.offsetWidth;
    var measureHeight = measure.offsetHeight;
    var measureTop = measure.offsetTop;
    var measureLeft = measure.offsetLeft;

    // Invalidate measure and force a full layout.
    Element child = measure.firstChild;
    child.remove();
    document.body.clientHeight;
    measure.append(child);

    var childOffsetTop = child.offsetTop;

    assert_equals(measureWidth, document.body.offsetWidth - 20);
    assert_equals(measureHeight, measure.offsetHeight);
    assert_equals(measureTop, childOffsetTop - 10);
    assert_equals(measureLeft, measure.offsetLeft);
  }, 'Test that partial layout works for offset{width, height, left, top} methods.');
}
