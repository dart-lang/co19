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

main() {
  document.body.setInnerHtml('''
      <p>The select below should be focused because we dispatched a mouse down event to it.</p>
      <p id="result">FAIL</p>
      <select id="select" size="4">
          <option>one</option>
          <option>two</option>
          <option>three</option>
          <option>four</option>
      </select>
      ''', treeSanitizer: new NullTreeSanitizer());

  var select = document.getElementById("select");

  select.onFocus.listen((_) {
    document.getElementById("result").innerHtml = "PASS";
  });

  var x = select.clientLeft + 10;
  var y = select.clientTop + 10;
  var event = new MouseEvent("mousedown", canBubble: true, cancelable: true,
      view: window, detail: 1,
      screenX: x, screenY: y,
      clientX: x, clientY: y,
      ctrlKey: false, altKey: false, shiftKey: false, metaKey: false,
      button: 0, relatedTarget: document);
  select.dispatchEvent(event);
}
