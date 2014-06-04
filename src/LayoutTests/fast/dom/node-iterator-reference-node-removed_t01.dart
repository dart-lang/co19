/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This test removes the NodeItertor's current reference node,
 * then continues to move through the document.
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
      <div id="testDiv" style="display:none;">
          <div id="div1">aaa</div>
          <div id="div2">bbb</div>
      </div>
      ''', treeSanitizer: new NullTreeSanitizer());

  var testDiv = document.getElementById("testDiv");
  var div1 = document.getElementById("div1");
  var div2 = document.getElementById("div2");
  var iter = new NodeIterator(testDiv, NodeFilter.SHOW_ELEMENT);

  shouldBe(iter.nextNode(), testDiv);
  shouldBe(iter.nextNode(), div1);
  shouldBe(iter.nextNode(), div2);
  shouldBe(iter.nextNode(), null);
  shouldBe(iter.previousNode(), div2);
  shouldBe(iter.previousNode(), div1);
  div1.remove();
  shouldBe(iter.nextNode(), div2);
}
