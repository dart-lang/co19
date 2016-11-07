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
      <p>This tests that dispatching a keyboard event created via dart does
      not crash.</p>
      <p id="results"></p>

      <input id="1"> 
      ''', treeSanitizer: new NullTreeSanitizer());

  var evt = new KeyboardEvent("keydown", canBubble:true, cancelable:true, view:window,
      keyLocation:0, ctrlKey:false, altKey:false, shiftKey:false, metaKey:false);
  var elt = document.getElementById("1");
  elt.focus();
  elt.dispatchEvent(evt);

  document.getElementById("results").text = "PASS";
}
