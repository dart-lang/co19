/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description No assertion failures even if an DOM mutation event handler
 * updates the new node created by Text::splitText.
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
    <div id="parent1">text</div>
    ''', treeSanitizer: new NullTreeSanitizer());

  var parent = document.getElementById('parent1');
  Text target = parent.firstChild;

  handleInsertion(_) {
    document.removeEventListener('DOMNodeInserted', handleInsertion);
    target.nextNode.remove();
  }

  document.addEventListener('DOMNodeInserted', handleInsertion, false);
  var r = new Range();
  //window.getSelection().addRange(r);
  r.setStart(target, 0);
  r.setEnd(target, 4);
  target.splitText(2);
  testPassed(' if the test wasn\'t terminated by an assertion.');
  parent.remove();
}
