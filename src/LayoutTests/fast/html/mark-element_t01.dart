/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Various tests for the mark element.
 */
import "dart:html";
import "../../../Utils/expect.dart";
import "../../testcommon.dart";

main() {
  var testParent = document.createElement('div');
  document.body.append(testParent);

  //debug('&lt;p> closes &lt;mark>:');
  testParent.setInnerHtml('<mark>Test that <p id="paragraph1">a p element</p> closes &lt;mark>.</p>',
      treeSanitizer: new NullTreeSanitizer());
  var paragraph1 = document.getElementById('paragraph1');
  Expect.isFalse(paragraph1.parentNode.nodeName == "mark");

  //debug('&lt;b> does not close &lt;mark>:');
  testParent.setInnerHtml('<mark>Test that <b id="b1">a b element</b> does not close a mark element.</mark>',
      treeSanitizer: new NullTreeSanitizer());
  var b1 = document.getElementById('b1');
  Expect.equals("MARK", b1.parentNode.nodeName);

  //debug('Residual style:');
  testParent.setInnerHtml('<b><mark id="mark2">This text should be bold.</mark> <span id="span1">This is also bold.</span></b>',
      treeSanitizer: new NullTreeSanitizer());
  getWeight(id) {
    return document.getElementById(id).getComputedStyle().getPropertyValue('font-weight');
  }
  Expect.equals("bold", getWeight("mark2"));
  Expect.equals("bold", getWeight("span1"));
  testParent.remove();
}
