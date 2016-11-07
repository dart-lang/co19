/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Ensures that replaceChild() throws an exception if mutation
 * even handler does something wrong
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
      <div>
        <div id="target">
          <b></b><b id="oldChild"></b><b></b>
        </div>
        <div id="newChild"></div>
      </div>
      ''', treeSanitizer: new NullTreeSanitizer());

  var target = document.getElementById('target');
  var oldChild = document.getElementById('oldChild');
  var newChild = document.getElementById('newChild');

  var numCalled = 0;

  handler(_) {
    numCalled++;
    if (numCalled < 2)
      return;
    document.removeEventListener("DOMNodeRemoved", handler, false);
    target.remove();
    newChild.append(target);
  }   

  document.addEventListener("DOMNodeRemoved", handler, false);

  shouldThrow(() => oldChild.replaceWith(newChild),
      (e) => e is DomException && e.name == DomException.HIERARCHY_REQUEST);
}
