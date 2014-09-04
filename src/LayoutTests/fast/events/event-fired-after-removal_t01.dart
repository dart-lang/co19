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
  document.body.setInnerHtml('''
      <p>This page verifies that queued event listeners keep firing even after a node has been removed from the document.</p>

      <div id="div"></div>
      ''', treeSanitizer: new NullTreeSanitizer());

  var result = [ ];

  reportResult(expected)
  {
    shouldBeList(result, expected);
  }

  var div = document.getElementById("div");
  div.addEventListener("click", (_) {
    result.add("f1");
    div.remove();
  }, false);

  div.addEventListener("click", (_) {
    result.add("f2");
  }, false);

  var event = new MouseEvent("click", canBubble: true, cancelable: true,
      view: window, detail: 1,
      screenX: 0, screenY: 0,
      clientX: 0, clientY: 0,
      ctrlKey: false, altKey: false, shiftKey: false, metaKey: false,
      button: 0, relatedTarget: document);
  div.dispatchEvent(event);

  reportResult([ "f1", "f2" ]);
}
