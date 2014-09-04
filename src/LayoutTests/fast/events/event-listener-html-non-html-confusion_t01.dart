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
      <p>This test checks for a particular problem in WebKit internals where adding the same function
      first as a non-HTML and then as an HTML event listener could leave the "is HTML" flag set wrong.</p>

      <p id="result"></p>

      <a href="javascript:void(document.getElementById('result').innerHTML = 'FAIL')" id="anchor">test anchor - script clicks this automatically</a>
      ''', treeSanitizer: new NullTreeSanitizer());

  listener(event)
  {
    document.getElementById('result').innerHtml = 'PASS';
    return false;
  }

  var anchor = document.getElementById("anchor");

  anchor.addEventListener("click", listener, false);
  anchor.onClick.listen(listener);

  var clickEvent = new MouseEvent("click", canBubble: true, cancelable: true,
      view: null, detail: 1,
      screenX: 1, screenY: 1,
      clientX: 1, clientY: 1,
      ctrlKey: false, altKey: false, shiftKey: false, metaKey: false,
      button: 0, relatedTarget: document);
  anchor.dispatchEvent(clickEvent);
}
