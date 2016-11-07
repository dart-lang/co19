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
      <p>Test for making sure that a crash does not happen when a focused node is removed in processing focusin eventListner.</p>
      <pre id="console"></pre>
      <h1 tabindex="0" id="a" ></h1>
      ''', treeSanitizer: new NullTreeSanitizer());

  focusinListener(evt) {
    try {
      evt.target.remove();
    } catch(e) {
    }
  }

  document.getElementById("a").addEventListener('focusin', focusinListener , false);
  document.getElementById("a").focus();
}
