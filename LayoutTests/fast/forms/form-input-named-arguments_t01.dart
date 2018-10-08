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
      <form>
      <input type="hidden" name="arguments"></input>
      <div id="divInsideForm"></div>
      </form>
      ''', treeSanitizer: new NullTreeSanitizer());

  var clicked = false;

  onclicked(_) {
    clicked = true;
  }

  var div = document.getElementById("divInsideForm");

  div.onClick.listen(onclicked);

  var event = new MouseEvent("click", canBubble: true, cancelable: true,
      view: window, detail: 0,
      screenX: 0, screenY: 0,
      clientX: 0, clientY: 0,
      ctrlKey: false, altKey: false, shiftKey: false, metaKey: false,
      button: 0, relatedTarget: null);

  div.dispatchEvent(event);
  shouldBeTrue(clicked);
}
