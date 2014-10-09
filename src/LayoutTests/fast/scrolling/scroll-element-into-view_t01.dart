/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion 
 * @description 
 */
import "dart:html";
import "../../testharness.dart";

const String htmlEL1 = r'''
<style>

#spacer {
  width: 1000px;
  height: 1000px;
}
#container {
  width: 310px;
  height: 310px;
  overflow: scroll;
  position: relative;
}
#focusable {
  position: absolute;
  background-color: #ace;
}
::-webkit-scrollbar {
  width: 10px;
  height: 10px;
}
::-webkit-scrollbar-thumb {
  background: #aaa;
}

</style>
''';

const String htmlEL2 = r'''
<div id="container">
  <div id="spacer"></div>
  <div id="focusable" tabindex="-1"></div>
</div>
''';

const x="x";
const y="y";
const w="w";
const h="h";

var container = document.querySelector('#container');
var focusable = document.querySelector('#focusable');

void runTest(Map elemRect, Map initialScroll, Map expectedFinalScroll) {
  focusable.style.left = '${elemRect[x]}px';
  focusable.style.top = '${elemRect[y]}px';
  focusable.style.width = '${elemRect[w]}px';
  focusable.style.height = '${elemRect[h]}px';

  container.scrollLeft = initialScroll[x];
  container.scrollTop = initialScroll[y];

  focusable.focus();
  focusable.blur();

  shouldBe(container.scrollLeft, expectedFinalScroll[x]);
  shouldBe(container.scrollTop, expectedFinalScroll[y]);
}

void main() {
    description('Tests that scrollable areas are scrolled to the correct location '
    + 'when an element is focused.');
    document.head.appendHtml(htmlEL1);
    document.body.appendHtml(htmlEL2);
    // Smaller fully offscreen element is centered when focused.
    runTest({x: 20, y: 20, w: 280, h: 280}, {x: 690, y: 690}, {x: 10, y: 10});
    runTest({x: 700, y: 700, w: 280, h: 280}, {x: 10, y: 10}, {x: 690, y: 690});
    
    // Larger fully offscreen element is centered when focused.
    runTest({x: 10, y: 10, w: 320, h: 320}, {x: 690, y: 690}, {x: 20, y: 20});
    runTest({x: 670, y: 670, w: 320, h: 320}, {x: 10, y: 10}, {x: 680, y: 680});
    
    // Smaller fully onscreen element does not scroll when focused.
    runTest({x: 10, y: 10, w: 100, h: 100}, {x: 10, y: 10}, {x: 10, y: 10});
    runTest({x: 210, y: 210, w: 100, h: 100}, {x: 10, y: 10}, {x: 10, y: 10});
    
    // Larger fully overlapping element does not scroll when focused.
    runTest({x: 10, y: 10, w: 310, h: 310}, {x: 20, y: 20}, {x: 20, y: 20});
    runTest({x: 20, y: 20, w: 310, h: 310}, {x: 20, y: 20}, {x: 20, y: 20});
    
    // Smaller overlapping element scrolls to nearest edge when focused.
    runTest({x: 20, y: 20, w: 280, h: 280}, {x: 290, y: 290}, {x: 20, y: 20});
    runTest({x: 700, y: 700, w: 280, h: 280}, {x: 410, y: 410}, {x: 680, y: 680});
    
    // Larger overlapping element scrolls to nearest edge when focused.
    runTest({x: 10, y: 10, w: 320, h: 320}, {x: 320, y: 320}, {x: 30, y: 30});
    runTest({x: 670, y: 670, w: 320, h: 320}, {x: 380, y: 380}, {x: 670, y: 670});
    
    checkTestFailures();
}
