/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Tests that an event handler registered on two nodes still fires
 * after one of the nodes has been GC'd.
 */
import "dart:html";
import "../../testcommon.dart";
import "../../../Utils/async_utils.dart";

main() {
  gc() {
    for (var i = 0; i < 10000; ++i)
      new Object();
  }

  var clickCount = 0;
  clickHandler(_) {
    ++clickCount;
  };

  (() {
    // Register 'clickHandler' on some referenced divs.
    var divs = [];
    for (var i = 0; i < 100; ++i) {
      var div = document.createElement("div");
      div.addEventListener("click", clickHandler, false);
      divs.add(div);
    }

    // Register 'clickHandler' on some garbage divs.
    for (var i = 0; i < 100; ++i) {
      var div = document.createElement("div");
      div.addEventListener("click", clickHandler, false);
    }

    // GC the garbage divs.
    gc();

    for (var i = 0; i < 100; ++i) {
      var clickEvent = new MouseEvent("click", canBubble: true, cancelable: true,
        view: null, detail: 1,
        screenX: 1, screenY: 1,
        clientX: 1, clientY: 1,
        ctrlKey: false, altKey: false, shiftKey: false, metaKey: false,
        button: 0, relatedTarget: document);
      divs[i].dispatchEvent(clickEvent);
    }

    shouldBe(clickCount, 100);
  })();
}
