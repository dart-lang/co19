/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Tests to ensure that dblclick event is not fired.
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
      <div id='top'>
      </div>
      <pre id="console"></pre>
      ''', treeSanitizer: new NullTreeSanitizer());

  clickHandler(event) {
    testPassed('click event is fired.');
  }

  dblclickHandler(event) {
    testFailed('dblclick event should not be fired.');
  }

  test()
  {
    var node = document.getElementById('top');
    node.addEventListener('click', clickHandler, false);
    node.addEventListener('dblclick', dblclickHandler, false);

    var event = new MouseEvent("click", canBubble: true, cancelable: false,
        view: window, detail: 2,
        screenX: 10, screenY: 10,
        clientX: 10, clientY: 10,
        ctrlKey: false, altKey: false, shiftKey: false, metaKey: false,
        button: 0, relatedTarget: null);
    node.dispatchEvent(event);
  }

  test();
}
