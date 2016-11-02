/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description No assertion failures even if a DOM mutation event handler 
 * updates nodes in a Range during Range::insertNode.
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
    <div id="parent1">text</div>
    <div id="parent2">text</div>
    ''', treeSanitizer: new NullTreeSanitizer());
  var parent, parent2;

  handleInsertion(_) {
    document.removeEventListener('DOMNodeInserted', handleInsertion);
    parent.innerHtml = '';
  }
  document.addEventListener('DOMNodeInserted', handleInsertion);
  parent = document.getElementById('parent1');
  var r = new Range();
  window.getSelection().addRange(r);
  r.setStart(parent, 0);
  r.setEnd(parent, 0);
  r.insertNode(document.createElement('span'));
  parent.remove();

  handleInsertion2(_) {
    if (parent.childNodes.length != 3)
      return;
    var textNodeCreatedBySplitText = parent.lastChild;
    textNodeCreatedBySplitText.remove();
    document.removeEventListener('DOMNodeInserted', handleInsertion2);
  }
  document.addEventListener('DOMNodeInserted', handleInsertion2);
  parent = parent2 = document.getElementById('parent2');
  r.setStart(parent2.firstChild, 2);
  r.setEnd(parent2.firstChild, 2);
  r.insertNode(document.createElement('span'));

  testPassed('if this did not crash.');
  parent.remove();
}
