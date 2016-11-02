/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description It tests whether replaceChild() works correctly when the new
 * node and the old node are siblings.
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
      <div id="parent">
      <div id="child1"></div><div id="child2"></div>
      </div>
      ''', treeSanitizer: new NullTreeSanitizer());

  var obj = document.getElementById('child1');
  var parent = document.getElementById('parent');
  var nextobj = document.getElementById('child2');
  nextobj.replaceWith(obj);
  shouldBe(parent.children.length, 1);
}
