/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Range.surroundContents() should not throw exception for 
 * detached node.
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
    <div id="container">
    <p id="description"></p>
    <div id="sample">0123456789</div>
    </div>
    <div id="console"></div>
    ''', treeSanitizer: new NullTreeSanitizer());

  $(id) { return document.getElementById(id); }

  surroundContents(node) {
    var range = document.createRange();
    range.setStart(node.firstChild, 2);
    range.setEnd(node.firstChild, 6);
    var newNode = document.createElement('b');
    range.surroundContents(newNode);
    return newNode.outerHtml;
  }

  var sample = $('sample');
  var expected = '<b>' + sample.firstChild.text.substring(2, 6) + '</b>';
  shouldBeEqualToString(surroundContents(sample.clone(true)), expected);
  sample.remove();
  shouldBeEqualToString(surroundContents(sample), expected);
}
