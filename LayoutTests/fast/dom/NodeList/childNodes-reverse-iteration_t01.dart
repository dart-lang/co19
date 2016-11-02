/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This is an integration test for childNodes.
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  var node = new PreElement();
  document.body.append(node);

  for (var j = 0; j < 5; ++j) {
    var child = document.createElement('div');
    child.innerHtml = (j + 1).toString();
    node.append(child);
    for (var i = node.childNodes.length - 1; i >= 0; --i) {
      var actual = node.childNodes[i] != null
        ? (node.childNodes[i] as HtmlElement).innerHtml : '';
      if (actual != (i + 1).toString()) {
        testFailed('Got $actual on ${i + 1} st/nd/th child after adding ${j + 1} st/nd/th child.');
      }
    }
  }

  shouldBe(node.text, '12345');
}

