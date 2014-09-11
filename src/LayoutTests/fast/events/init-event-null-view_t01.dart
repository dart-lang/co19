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
      <p>This is a regression test for <a href="https://bugs.webkit.org/show_bug.cgi?id=4298">bug 4298</a>. Without the bug fix it causes a crash.</p>
      <hr>
      <p><div id=console></div></p>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.body.id = "root";

  print(message) {
    var paragraph = document.createElement("p");
    paragraph.append(new Text(message));
    document.getElementById("console").append(paragraph);
  }

  var ev = new MouseEvent("click", canBubble: true, cancelable: true,
      view: null, detail: 1,
      screenX: 1, screenY: 1,
      clientX: 1, clientY: 1,
      ctrlKey: false, altKey: false, shiftKey: false, metaKey: false,
      button: 0, relatedTarget: document);
  print("Successfully created a mouse event object without a view and didn't crash.");
}
