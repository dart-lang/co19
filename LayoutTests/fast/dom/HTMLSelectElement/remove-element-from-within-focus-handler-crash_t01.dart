/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Layout test for bug 23858
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  /*document.body.setInnerHtml('''
    <select id="bomb" onfocus="this.parentNode.removeChild(this)">
        <option>Clicking on this select element should not crash</option>
    </select>
    ''', treeSanitizer: new NullTreeSanitizer());*/
  
  document.body.setInnerHtml('''
    <select id="bomb">
        <option>Clicking on this select element should not crash</option>
    </select>
    ''', treeSanitizer: new NullTreeSanitizer());

  SelectElement select = document.getElementById('bomb');

  select.onFocus.listen((_) {
    select.remove();
  });

  var mouseEvent = new MouseEvent("mousedown", canBubble: true,
      cancelable: true, view: window, detail: 1,
      screenX: select.offsetLeft + 1, screenY: select.offsetTop + 1,
      clientX: select.offsetLeft + 1, clientY: select.offsetTop + 1,
      ctrlKey: false, altKey: false, shiftKey: false, metaKey: false,
      button: 0, relatedTarget: document);

  select.dispatchEvent(mouseEvent);
}
