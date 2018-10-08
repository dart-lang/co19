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
      <p>The test verifies that addEventListener works on EventTargets that do not have ScriptExecutionContext at the moment of call. The event listener should be added, and later invoked when the Context is established. This matches behavior of FF 3.5</p>
      <p>The only way to simulate this is to use createDocumentType() which creates a Node with NULL Document. Then we insert it into the tree so it gains a pointer to Document and dispatch the event which should fire.</p>
      <p>We use manually-constructed event instead just watching for DOM mutation event on insert since DOM mutation events are not dispatched on doctype element.</p>
      <p>Test passes if there is 'PASS' text below.</p>
      <div id="log">FAIL</div>
      ''', treeSanitizer: new NullTreeSanitizer());

  onClick(_) {
    document.getElementById("log").innerHtml = "PASS";
    asyncEnd();
  }

  test() {
    asyncStart();

    var doctype = document.implementation.createDocumentType(
        'html',
        '-//W3C//DTD XHTML 1.0 Strict//EN',
        'http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd'
        );

    var evt = new MouseEvent("click", canBubble: false, cancelable: false);
    doctype.addEventListener('click', onClick, false);

    // Doctype node can only be inserted before <html>. 
    document.insertBefore(doctype, document.getElementsByTagName("html")[0]);
    doctype.dispatchEvent(evt);
  }

  test();
}
