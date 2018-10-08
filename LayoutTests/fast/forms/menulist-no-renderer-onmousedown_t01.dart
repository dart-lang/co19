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
      This tests that we don't crash if a menu list's renderer is destroyed during the mouse down event.
      <br>
      <select id="sl" onmousedown=><option>test</select>
      ''', treeSanitizer: new NullTreeSanitizer());

  var sl = document.getElementById('sl');
  sl.onMouseDown.listen((_) {
    sl.style.display='none';
  });
  var event = new MouseEvent("mousedown", canBubble: true, cancelable: true,
      view: window, detail: 1,
      screenX: sl.offsetLeft, screenY: sl.offsetTop,
      clientX: sl.offsetLeft, clientY: sl.offsetTop,
      ctrlKey: false, altKey: false, shiftKey: false, metaKey: false,
      button: 0, relatedTarget: document);
  sl.dispatchEvent(event);
}
