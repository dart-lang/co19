/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description 
 */
import "dart:html";
import "../../../../Utils/expect.dart";
import "../../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
    <div id="container">
    <div id="sample">foobar</div>baz
    </div>
    ''', treeSanitizer: new NullTreeSanitizer());

  $(id) { return document.getElementById(id); }

  removingHandler(_)
  {
    document.removeEventListener('DOMNodeRemovedFromDocument', removingHandler, true);
    var range = document.createRange();
    range.setStart($('sample').nextNode, 1);
    range.insertNode(new Text('FOO'));
  }

  document.addEventListener('DOMNodeRemovedFromDocument', removingHandler, true);

  var range = document.createRange();
  range.setStart($('sample'), 0);
  range.setEnd($('sample').nextNode, 3);
  range.deleteContents();

  document.body.innerHtml = 'PASS; NOT CRASHED';
}
