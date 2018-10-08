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
      <p>The test verifies that EventTarget with an event listener not inserted into a Document does not crash during an attempt to dispatch an event.</p>
      <p>Test passes if there is no crash, and event is dispatched.</p>
      ''', treeSanitizer: new NullTreeSanitizer());

  test() {
    var doctype = document.implementation.createDocumentType(
        'html',
        '-//W3C//DTD XHTML 1.0 Strict//EN',
        'http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd'
        );

    var evt = new Event("generic", canBubble:true, cancelable:true);

    doctype.addEventListener("generic", (_) {
      asyncEnd();
    }, false);

    asyncStart();
    doctype.dispatchEvent(evt);
  }

  test();
}
