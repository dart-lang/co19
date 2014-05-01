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
import "../../../../Utils/async_utils.dart";
import "../../../testcommon.dart";
import "pwd.dart";

main() {
  document.body.setInnerHtml('''
    <div id="reference" style="position: absolute; top: 0; bottom: 0; left: 0; right: 0; background: yellow; z-index: 1"></div>

    <div style="position: absolute; z-index: 2">
        <p>This test checks that the yellow reference DOM node (which should be as
        big as the window) gets resized when the window is resized.</p>
        
        <p>To avoid relayouts and repaints caused by DOM-based logging, it doesn't
        output anything. Please check the console for confirmation that the node
        dimensions increase by 10x10.</p>
    </div>
    ''', treeSanitizer: new NullTreeSanitizer());

  var referenceNode = document.getElementById('reference');
  var initialWidth = referenceNode.offsetWidth;
  var initialHeight = referenceNode.offsetHeight;
  window.resizeBy(10, 10);
  shouldBe(referenceNode.offsetWidth, initialWidth+10);
  shouldBe(referenceNode.offsetHeight, initialHeight+10);
}
