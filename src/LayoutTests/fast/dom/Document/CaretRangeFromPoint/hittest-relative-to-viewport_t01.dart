/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This checks for proper behavior of caretRangeFromPoint before
 * and after scrolling.
 */
import "dart:html";
import "../../../../../Utils/expect.dart";
import "../../../../testcommon.dart";

main() {
  var style = new Element.html('''
    <style>
        .test {
            width: 100px;
            font-family: "Ahem";
        }
        .pusher {
            width: 4000px;
            height: 1000px;
            outline: 1px solid black;
        }
    </style>
    ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);
    
  document.body.setInnerHtml('''
    <div id="testArea">
        <div id="test-top" class="test">xxxxx xxxxx xxxxx xxxxx</div>
        <div class="pusher">This box is here to create scrollbars.</div>
        <div id="test-bottom" class="test" style="margin-left: 900px;">xxxxx xxxxx xxxxx xxxxx</div>
        <div class="pusher">This box is here to create additional space for the hit tests which must initially be in the scroll area.</div>
    </div>
    ''', treeSanitizer: new NullTreeSanitizer());

  var elementTop = document.getElementById('test-top'),
      elementBottom = document.getElementById('test-bottom');
        
  var BASE_DEVICE_PIXEL_RATIO = window.devicePixelRatio;

  scrollTo(x, y) {
    window.scrollTo(x.round(), y.round());
  }
  caretRangeFromPoint(x, y)
    => document.caretRangeFromPoint(x.round(), y.round());

  testsWithBaseline(baselinePos, expectedContainer) {
    test(expectedOffset, scrollByX, scrollByY) {
      var zoomRatio = BASE_DEVICE_PIXEL_RATIO / window.devicePixelRatio;
      var hitPosition = new Point(15 * zoomRatio, 15 * zoomRatio);

      scrollRelativeToBaseline(x, y) {
        scrollTo(baselinePos.x + x, baselinePos.y + y);
      }

      // Scroll relative to target.
      scrollRelativeToBaseline(scrollByX, scrollByY);

      var range = caretRangeFromPoint(hitPosition.x, hitPosition.y);

      // shouldn't return null range on any of these tests
      Expect.isNotNull(range,
         "null range was returned from document.caretRangeFromPoint("
         + hitPosition.x.toString() + ", " + hitPosition.y.toString()
         + ") at window scroll position " + window.scrollX.toString()
         + "x" + window.scrollY.toString());

      Expect.isTrue(range.startContainer == expectedContainer,
          "Range.startContainer check (got " + range.startContainer.toString()
          + ", expected " + expectedContainer.toString() + ")");

      Expect.isTrue((range.startOffset - expectedOffset).abs() < zoomRatio,
          "Range.startOffset check (got " + range.startOffset.toString()
          + ", expected " + expectedOffset.toString() + ")");
    }

    test(0, 0, 0);
    test(12, 0, 25);
    test(2, 25, 0);
    test(14, 25, 25);
  }

  var rectTop = elementTop.getBoundingClientRect(),
      rectBottom = elementBottom.getBoundingClientRect(),
      // Subtract some distance so we aren't in the very top left of the target.
      topBaseline = new Point(rectTop.left - 8, rectTop.top - 8),
      bottomBaseline = new Point(rectBottom.left - 8, rectBottom.top - 8);

  // Testing inside initial containing block (top left)
  testsWithBaseline(topBaseline, elementTop.firstChild);

  // Testing outside initial containing block (mid-page)
  testsWithBaseline(bottomBaseline, elementBottom.firstChild);

  //eventSender.zoomPageOut();
  //testsWithBaseline(topBaseline, elementTop.firstChild);
}
