/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description 
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  var elementNotInDocument = document.createElement('div');
  elementNotInDocument.id = "element-not-in-document";
  elementNotInDocument.addEventListener('click', (event) {
    shouldBe(event.path.length, 1);
    shouldBe(event.path[0].id, "element-not-in-document");
  });
  var clickEvent = new MouseEvent("click", canBubble: true,
      cancelable: false, view: window, detail: 0,
      screenX: 0, screenY: 0, clientX: 0, clientY: 0,
      ctrlKey: false, altKey: false, shiftKey: false, metaKey: false,
      button: 0, relatedTarget: null);
  elementNotInDocument.dispatchEvent(clickEvent);
}
