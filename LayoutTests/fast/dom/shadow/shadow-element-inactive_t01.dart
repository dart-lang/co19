/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description We should not expose UA shadow nodes.
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  var elementNames = ['applet', 'details', 'embed', 'input', 'object', 'summary'];
  var root2;
  elementNames.forEach((elementName) {
    debug(elementName);
    var target = document.createElement(elementName);
    document.body.append(target);
    var root1 = target.createShadowRoot();
    root1.innerHtml = '<div><shadow></shadow></div>';
    root2 = root1.firstChild.createShadowRoot();
    root2.innerHtml = '<content select="*"></content>';
    shouldBe(root2.firstChild.getDistributedNodes().length, 0);
    target.remove();
  });
}
