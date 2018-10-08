/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Change popup to list inside mouse event handler.
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
      <p>This test should not crash.</p>
      <select id="select">
        <option value="0">One</option>
        <option value="1">Two</option>
        <option value="2">Three</option>
      </select>
      ''', treeSanitizer: new NullTreeSanitizer());

  SelectElement select = document.getElementById("select") as SelectElement;

  select.onFocus.listen((_) {
    select.size = 10;
    asyncEnd();
  });


  sendClick(_) {
    Rectangle rect = select.getBoundingClientRect();

    MouseEvent evt = new MouseEvent("mousedown", canBubble: true, cancelable: true,
        view: window, detail: 0,
        screenX: 0, screenY: 0,
        clientX: round(rect.top) + 4, clientY: round(rect.left) + 4,
        ctrlKey: false, altKey: false, shiftKey: false, metaKey: false,
        button: 0, relatedTarget: null);

    select.dispatchEvent(evt);
  }

  asyncStart();
  window.addEventListener('load', sendClick, false);
}
