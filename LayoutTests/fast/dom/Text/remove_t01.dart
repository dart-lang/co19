/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This tests the DOM 4 remove method on a Text node.
 */
import "dart:html";
import "../../../../Utils/expect.dart";
import "../../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
    <div id="test"></div>
    ''', treeSanitizer: new NullTreeSanitizer());

  var testDiv = document.getElementById('test');
  var text = new Text('text');
  testDiv.append(text);
  shouldBe(testDiv.childNodes.length, 1);
  text.remove();
  shouldBe(testDiv.childNodes.length, 0);
  text.remove();
  shouldBe(testDiv.childNodes.length, 0);
}
