/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Test passes if it does not crash.
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
      <span id=container><span></span></span>
      <span id=newChild></span>
      <div>PASS</div>
      ''', treeSanitizer: new NullTreeSanitizer());

  var container = document.getElementById('container');
  var newChild = document.getElementById('newChild');
  handleNodeRemoved(_) {
    newChild.removeEventListener('DOMNodeRemoved', handleNodeRemoved);
    container.innerHtml = '';
    gc();
  }
  newChild.addEventListener('DOMNodeRemoved', handleNodeRemoved, false);
  var range = document.createRange();
  range.selectNodeContents(container);
  range.insertNode(newChild);
}
