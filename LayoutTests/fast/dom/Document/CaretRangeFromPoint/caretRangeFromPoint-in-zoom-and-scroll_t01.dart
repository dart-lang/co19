/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description
 * @needsreview
 */
import "dart:html";
import "../../../../../Utils/expect.dart";
import "../../../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
    <div id="first" style="width: 4000px; height: 1000px">A long text to test document caretRangeFromPoint. Test scroll, zoom, zoomAndScroll .................................... The End </div>
    ''', treeSanitizer: new NullTreeSanitizer());

  sendClick(x, y)
  {
    var elem = document.elementFromPoint(x.round(), y.round());
    elem.click();
  }

  // 29 is the character offset in the div text "A long text to test document caretRangeFromPoint".
  var expectedOffset = 29;
    
  checkNodeAndOffsetFromCaretRangeFromPoint(message, event)
  {
    var range = document.caretRangeFromPoint(event.clientX, event.clientY);
    Expect.isNotNull(range);
    var offset = range.startOffset;

    var node = document.getElementById("first").firstChild;

    Expect.equals(range.startContainer, node,
        message + " node should be div's child text node");

    Expect.equals(expectedOffset, offset,
        message + " offset actual: $offset; expected: $expectedOffset");

    asyncEnd();
  }
    
  checkBase(event)
  {
    checkNodeAndOffsetFromCaretRangeFromPoint("check base", event);
  }

  checkScroll(event)
  {
    checkNodeAndOffsetFromCaretRangeFromPoint("check scroll", event);
  }

  checkZoom(event)
  {
    checkNodeAndOffsetFromCaretRangeFromPoint("check zoom", event);
  }

  checkZoomScroll(event)
  {
    checkNodeAndOffsetFromCaretRangeFromPoint("check zoom and scroll", event);
  }

  scrollPage(x, y)
  {
    window.scrollTo(x.round(), y.round());
  }

  var range = document.createRange();
  var node = document.getElementById("first");
  // Set range in the middle of word "document".
  range.setStart(node.firstChild, expectedOffset);
  range.setEnd(node.firstChild, expectedOffset + 1);

  // Base test.
  asyncStart();
  window.addEventListener("click", checkBase, false);

  var rects = range.getClientRects();
  var x = rects[0].left;
  var y = rects[0].top + rects[0].width / 2;
  sendClick(x, y);
  window.removeEventListener("click", checkBase, false);

  // Test scroll.
  asyncStart();
  window.addEventListener("click", checkScroll, false);
  scrollPage(x / 2, 0);
  sendClick(x / 2, y);
  scrollPage(0, 0);
  window.removeEventListener("click", checkScroll, false);

  // Test zoom.
  asyncStart();
  window.addEventListener("click", checkZoom, false);
  node.style.zoom = "2.0";
  rects = range.getClientRects();
  x = rects[0].left;
  y = rects[0].top + rects[0].width / 2;
  sendClick(x * 2, y);
  window.removeEventListener("click", checkZoom, false);

  // Test scroll and Zoom.
  asyncStart();
  window.addEventListener("click", checkZoomScroll, false);
  scrollPage(x, 0);
  sendClick(x, y);
  scrollPage(0, 0);
  node.style.zoom = "1.0";
  window.removeEventListener("click", checkZoomScroll, false);
}
